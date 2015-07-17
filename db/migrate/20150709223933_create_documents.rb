class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :code
      t.integer :version
      t.hstore :details, default: {}, null: false

      t.timestamps null: false
    end
  end
end
