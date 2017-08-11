class RemoveUploadDateFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :upload_date, :datetime
  end
end
