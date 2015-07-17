class Dropdocuments < ActiveRecord::Migration
  def change
    drop_table :documents
  end
end
