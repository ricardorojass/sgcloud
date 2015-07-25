class AddReferencesCategoryToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :category, index: true, foreign_key: true
  end
end
