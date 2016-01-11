class CreateHatchyRewards < ActiveRecord::Migration
  def change
    create_table :hatchy_rewards do |t|
    	t.belongs_to 	:project
    	t.decimal 		:min_value, 					null: false
    	t.integer			:max_contributions
    	t.string			:description, 				null: false
    	t.integer			:row_order
    	t.datetime		:deliver_at, 					null: false
      t.timestamps
    end
    add_index :hatchy_rewards, :project_id
  end
end
