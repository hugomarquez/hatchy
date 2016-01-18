class CreateHatchyContributions < ActiveRecord::Migration
  def change
    create_table :hatchy_contributions do |t|
      t.belongs_to    :project
      t.belongs_to    :user 
      t.belongs_to    :reward
      t.belongs_to    :country
      t.decimal       :value,             null: false
      t.string        :status,            null: false
      t.string        :step,              null: false
      t.string        :name
      t.string        :email
      t.string        :document
      t.string        :address_street
      t.string        :address_number
      t.string        :address_city
      t.string        :address_zip
      t.string        :address_state
      t.string        :address_phone
      t.string        :ip_address
      t.string        :card_type
      t.date          :card_expires_on
      t.boolean       :anonymous,         default: false
      t.boolean       :notified_when_finish
      t.timestamps
    end
    add_index :hatchy_contributions, :project_id
    add_index :hatchy_contributions, :user_id
    add_index :hatchy_contributions, :reward_id
    add_index :hatchy_contributions, :country_id
  end
end
