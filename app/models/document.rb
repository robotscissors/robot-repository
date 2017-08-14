class Document < ActiveRecord::Base
  validates :title, length: {minimum: 5}, presence: true
  validates :description, length: {minimum: 20}, presence: true
  validates :user_id, presence: true
  belongs_to :user

  has_attached_file :document_file
  validates_attachment_content_type :document_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
  #validates_attachment :document_file, content_type: { content_type: "application/pdf" }
end
