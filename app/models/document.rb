class Document < ActiveRecord::Base
  validates :title, length: {minimum: 5}, presence: true
  validates :description, length: {minimum: 20}, presence: true
  validates :user_id, presence: true
  #validates :document_file, presence: true
  belongs_to :user
  searchkick

  has_attached_file :document_file, :path => "/documents/:id/:filename", :preserve_files => "true",
                    :styles => {
                      :text => {
                        :processors => [:docsplit_text],
                        :format => "txt",
                        :full_text_column => :file_full_text
                      }
                    }

  # has_attached_file :document_file, :path => "/documents/:id/:filename", :preserve_files => "true",
  #                   :styles => {
  #                     :text => {
  #                       :processors => [:docsplit_text],
  #                       :format => "txt",
  #                       :full_text_column => :file_full_text
  #                     },
  #                     :pdf => {
  #                      :format => "pdf",
  #                      :processors => [:docsplit_pdf]
  #                    }
  #                   }

  #validates_attachment_content_type :document_file, :content_type => ['application/pdf']
  #has_attached_file :document_file, :path => "/documents/:id/original/:filename"
  #validates_attachment_content_type :document_file, content_type: { content_type: ['application/msword', 'application/pdf','application/vnd.openxmlformats-officedocument.wordprocessingml.document'] }
  #validates_attachment :document, content_type: { content_type: "application/pdf",  }
  #validates_attachment :document_file, :content_type => ['application/msword', 'application/pdf','application/vnd.openxmlformats-officedocument.wordprocessingml.document']
  #validates_attachment_content_type :document_file, content_type: { content_type: ['application/msword', 'application/pdf'] }
end
