class CreateHatchyBanks < ActiveRecord::Migration
  def change
    create_table :hatchy_banks do |t|
    	t.string 	:name, null: false, limit: 80
    	t.string	:code, null: false, limit: 10
      t.timestamps
    end
    add_index :hatchy_banks, :code, unique: true
  end
end
