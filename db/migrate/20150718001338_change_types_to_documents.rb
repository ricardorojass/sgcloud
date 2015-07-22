class ChangeTypesToDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :origin, default: [], array: true
    remove_column :documents, :categories, default: [], array: true
  end
end
