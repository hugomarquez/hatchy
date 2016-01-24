class CreateHatchyProjectPosts < ActiveRecord::Migration
  def change
    create_table :hatchy_project_posts do |t|
    	t.belongs_to		:user
    	t.belongs_to		:project
    	t.boolean				:private
    	t.text					:title
    	t.text					:content
      t.timestamps null: false
    end
    add_index :hatchy_project_posts, [:user_id, :project_id]
  end
end
