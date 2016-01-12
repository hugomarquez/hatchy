class CreateHatchyBankAccounts < ActiveRecord::Migration
  def change
    create_table :hatchy_bank_accounts do |t|
      t.belongs_to  :user
      t.belongs_to  :bank
      t.string      :account,       null: false
      t.string      :account_digit, null: false
      t.timestamps
    end
    add_index :hatchy_bank_accounts, [:user_id, :bank_id]
  end
end
