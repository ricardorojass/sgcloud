class AddColumnsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :origin, :integer, default: 0, null: false
    add_column :documents, :categories, :integer, default: 0, null: false
  end
end
