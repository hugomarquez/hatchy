class DeviseCreateHatchyUsers < ActiveRecord::Migration
  def change
    create_table(:hatchy_users) do |t|
      t.belongs_to  :country
      t.string      :profile_img
      t.string      :cover_img
      t.string      :facebook_link
      t.string      :twitter_link
      t.string      :other_link
      t.string      :username,          null: false
      t.string      :first_name
      t.string      :last_name
      t.string      :about
      t.boolean     :newsletter,        null: false, default: true
      t.boolean     :subs_projects,     null: false, default: true
      t.string      :locale,            null: false, default: "en"
      t.string      :address_street
      t.string      :address_number
      t.string      :address_city
      t.string      :address_state
      t.string      :address_zip
      t.string      :document
      t.string      :phone
      t.string      :mobile
      ## Database authenticatable
      t.boolean  :admin,            null: false, default: false
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :hatchy_users, :email,                unique: true
    add_index :hatchy_users, :username,             unique: true
    add_index :hatchy_users, :reset_password_token, unique: true
    add_index :hatchy_users, :country_id
    # add_index :hatchy_users, :confirmation_token,   unique: true
    # add_index :hatchy_users, :unlock_token,         unique: true
  end
end
