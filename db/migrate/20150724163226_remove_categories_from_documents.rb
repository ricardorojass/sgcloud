class RemoveCategoriesFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :categories, :hstore
  end
end
