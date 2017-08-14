class AddFileToDocuments < ActiveRecord::Migration
  def change
    add_attachment :documents, :document_file
  end
end
