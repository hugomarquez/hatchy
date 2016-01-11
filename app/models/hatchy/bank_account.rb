module Hatchy
  class BankAccount < ActiveRecord::Base

  	belongs_to :user, class_name:'Hatchy::User'
  	belongs_to :bank, class_name:'Hatchy::Bank'
  	validates :user, :bank, :account, :account_digit, presence: true
  	
  end
end
