class Document < ActiveRecord::Base
  validates :title, length: {minimum: 5}, presence: true
  validates :description, length: {minimum: 20}, presence: true
  validates :user_id, presence: true
  #validates :document_file, presence: true
  belongs_to :user

  #has_attached_file :document_file, :path => "/documents/:id/:style/:filename", :url => "/documents/preview/:filename", :styles => { :thumb => ["300x400>", :jpg] }, :processors => [:thumbnail]
  has_attached_file :document_file, :path => "/documents/:id/:filename"
  validates_attachment :document_file, content_type: { content_type: ['application/msword', 'application/pdf','application/vnd.openxmlformats-officedocument.wordprocessingml.document'] }
  #validates_attachment_content_type :document_file, content_type: /\Aimage\/.*\z/

  def save_document
    if self.save
      flash[:notice] = "Document is uploading!"
      puts "Success"
      redirect_to documents_path
    else
      flash[:alert] = "There was an error saving the document. Please try again."
      puts "There is an error"
      render :new
    end
  end

end
