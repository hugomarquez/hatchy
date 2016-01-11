class CreateHatchyProjects < ActiveRecord::Migration
  def change
    create_table :hatchy_projects do |t|
    	t.belongs_to    :user
    	t.belongs_to    :category
    	t.string        :project_img
    	t.string        :city
    	t.string 				:name, 								null: false
    	t.string 				:headline
    	t.string 				:about
    	t.string 				:budget
    	t.string 				:video_url
    	t.string 				:short_url
    	t.decimal	 			:goal,                precision: 8, scale: 2
    	t.integer 	    :online_days
    	t.timestamp			:online_date
    	t.timestamp			:expires_at
      t.timestamp     :rejected_at
      t.timestamp     :send_to_draft_at
    	t.string 				:status,							null: false
    	t.boolean 	    :recommended,         null: false, default: false
      t.timestamps
    end
    add_index :hatchy_projects, :user_id
    add_index :hatchy_projects, :category_id
  end
end
