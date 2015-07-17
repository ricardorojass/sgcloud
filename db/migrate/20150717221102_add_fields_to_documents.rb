class AddFieldsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :title, :string
    add_column :documents, :description, :text
    add_column :documents, :location, :string
  end
end
