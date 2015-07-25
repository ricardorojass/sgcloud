class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :value
      t.integer :cat_count

      t.timestamps null: false
    end
  end
end
