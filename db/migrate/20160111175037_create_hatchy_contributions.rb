class CreateHatchyContributions < ActiveRecord::Migration
  def change
    create_table :hatchy_contributions do |t|
    	t.belongs_to	  :project
    	t.belongs_to	  :user 
    	t.belongs_to	  :reward
    	t.belongs_to	  :country
    	t.decimal		  	:value, 						null: false
    	t.string        :status,						null: false
    	t.string		  	:name,							null: false
    	t.string		  	:email,							null: false
    	t.string		  	:document,					null: false
    	t.string		  	:address_street,		null: false
    	t.string		  	:address_number,		null: false
    	t.string		  	:address_city,			null: false
    	t.string		  	:address_zip,				null: false
    	t.string		  	:address_state,			null: false
    	t.string		  	:address_phone,			null: false
      t.string        :ip_address
      t.string        :card_type, 				null: false
      t.date          :card_expires_on,		null: false
    	t.boolean       :anonymous,					default: false
    	t.boolean       :notified_when_finish
      t.timestamps
    end
    add_index :hatchy_contributions, :project_id
    add_index :hatchy_contributions, :user_id
    add_index :hatchy_contributions, :reward_id
    add_index :hatchy_contributions, :country_id
  end
end
