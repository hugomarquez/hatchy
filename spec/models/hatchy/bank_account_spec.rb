require 'rails_helper'
module Hatchy
  RSpec.describe BankAccount, type: :model do
    let(:bank_account){ create(:bank_account) }

    describe "associations" do 
      it{ is_expected.to belong_to :bank }
      it{ is_expected.to belong_to :user }
    end
    
    describe "validations" do 
      bank = FactoryGirl.create(:hatchy_bank_account)
      it { should validate_presence_of(:user) }
      it { should validate_presence_of(:bank) }
      it { should validate_presence_of(:account) }
      it { should validate_presence_of(:account_digit) }
    end

  end
end