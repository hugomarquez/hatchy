class CreateHatchyProjectAccounts < ActiveRecord::Migration
  def change
    create_table :hatchy_project_accounts do |t|
      t.belongs_to  :project
      t.belongs_to  :bank
      t.string      :account_type
      t.string      :email
      t.string      :phone
      t.string      :account
      t.string      :account_digit
      t.string      :owner_name
      t.string      :owner_document 
      t.string      :address_street
      t.string      :address_number
      t.string      :address_city
      t.string      :address_state
      t.string      :address_zip
      t.timestamps
    end
    add_index :hatchy_project_accounts, :project_id
    add_index :hatchy_project_accounts, :bank_id
  end
end
