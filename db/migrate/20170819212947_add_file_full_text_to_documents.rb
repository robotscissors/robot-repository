class AddFileFullTextToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :file_full_text, :text
  end
end
