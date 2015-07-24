class AddCategoriesToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :categories, :hstore
  end
end
