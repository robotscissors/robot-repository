class Document < ActiveRecord::Base
  validates :title, length: {minimum: 5}, presence: true
  validates :description, length: {minimum: 20}, presence: true
  validates :user_id, presence: true
  validates :document_file, presence: true

  belongs_to :user
  searchkick

  # has_attached_file :document_file, :path => "/documents/:id/:filename", :preserve_files => "true",
  #                   :styles => {
  #                     :text => {
  #                       :processors => [:docsplit_text],
  #                       :format => "txt",
  #                       :full_text_column => :file_full_text
  #                     }
  #                   }
  has_attached_file :document_file, :path => "/documents/:id/:filename", :preserve_files => "true",
                    :styles => {
                      :text => {
                        :processors => [:docsplit_text],
                        :format => "txt"
                      }
                    }

end
