class AddCategoriesToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :categories, :text, array: true, default: []
  end
end
