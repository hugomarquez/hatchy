class CreateHatchyAnnouncements < ActiveRecord::Migration
  def change
    create_table :hatchy_announcements do |t|
    	t.text 		:message,			null:false, limit: 80
    	t.timestamp 	:starts_at,		null: false
    	t.timestamp 	:ends_at,			null: false
    	t.timestamps
    end
  end
end
