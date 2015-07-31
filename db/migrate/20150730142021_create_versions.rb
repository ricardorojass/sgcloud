class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :number
      t.references :document, index: true

      t.timestamps null: false
    end
  end
end
