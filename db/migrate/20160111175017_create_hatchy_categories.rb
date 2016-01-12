class CreateHatchyCategories < ActiveRecord::Migration
  def change
    create_table :hatchy_categories do |t|
      t.string   :name, null: false
      t.timestamps
    end
    add_index :hatchy_categories, :name, unique: true
  end
end
