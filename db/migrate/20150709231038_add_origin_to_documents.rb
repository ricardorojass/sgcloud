class AddOriginToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :origin, :string, array: true, default: []
  end
end
