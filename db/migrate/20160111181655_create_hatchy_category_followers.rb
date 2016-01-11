class CreateHatchyCategoryFollowers < ActiveRecord::Migration
  def change
    create_table :hatchy_category_followers do |t|
    	t.belongs_to	:category
    	t.belongs_to	:user
      t.timestamps
    end
    add_index :hatchy_category_followers, [:user_id, :category_id]
  end
end
