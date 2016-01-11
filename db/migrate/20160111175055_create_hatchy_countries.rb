class CreateHatchyCountries < ActiveRecord::Migration
  def change
    create_table :hatchy_countries do |t|
    	t.string 	:name
    	t.string	:code2
    	t.string	:code3
    	t.string	:continent
    	t.string	:tld
    	t.string	:currency
    	t.boolean :eu_member, default: false
      t.timestamps
    end
  end
end
