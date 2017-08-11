class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.text :keywords
      t.timestamp :upload_date

      t.timestamps null: false
    end
  end
end
