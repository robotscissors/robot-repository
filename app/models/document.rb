class Document < ActiveRecord::Base
  validates :title, length: {minimum: 5}, presence: true
  validates :description, length: {minimum: 20}, presence: true
  validates :user_id, presence: true
  #validates :document_file, presence: true
  belongs_to :user

  has_attached_file :document_file, :path => "/documents/:id/:filename", :url => "/documents/preview/:filename", :style => { :thumb => ["300x400>", :jpg] }
  validates_attachment :document_file, content_type: { content_type: ['application/msword', 'application/pdf','application/vnd.openxmlformats-officedocument.wordprocessingml.document'] }

end
