class RemoveVersionFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :version, :integer
  end
end
