class AddIndexToDocumentsCategories < ActiveRecord::Migration
  def change
    add_index :documents, :categories, using: :gin
  end
end
