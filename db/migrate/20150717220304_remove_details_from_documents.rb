class RemoveDetailsFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :details, :hstore
  end
end
