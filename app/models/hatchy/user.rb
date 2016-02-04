module Hatchy
  class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable

    belongs_to :country,          class_name:'Hatchy::Country'
    has_many :projects,           class_name:'Hatchy::Project'
    has_many :category_followers, class_name:'Hatchy::CategoryFollower', dependent: :destroy
    has_many :categories,         through: :category_followers
    has_many :contributions,      class_name:'Hatchy::Contribution'
    has_many :payments,           through: :contributions
    has_many :credit_cards,       class_name:'Hatchy::CreditCard'
    has_one :bank_account,        class_name:'Hatchy::BankAccount', dependent: :destroy

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness:{case_sensitive: false}
    # Only allow letter, number, underscore and punctuation.
    validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

    mount_uploader :profile_img, Hatchy::UserUploader
    accepts_nested_attributes_for :bank_account, allow_destroy: true

    def full_name
      "#{first_name.capitalize} #{last_name.capitalize}"
    end

  end
end
