require 'rails_helper'
module Hatchy
  RSpec.describe User, type: :model do
    let(:user){ create(:user) }
    
    describe "associations" do 
      it{ is_expected.to have_many :contributions }
      it{ is_expected.to have_many :projects }
      it{ is_expected.to have_many(:categories).through(:category_followers) }
      it{ is_expected.to have_one :bank_account }
      it{ is_expected.to belong_to :country }
    end

    describe "validations" do 
      it { should validate_presence_of(:email) }
      it { should validate_uniqueness_of(:email) }
      it { should validate_presence_of(:username) }
      it { should validate_uniqueness_of(:username) }
      it { should_not allow_value("test@test").for(:username) }
      it { should accept_nested_attributes_for(:bank_account).allow_destroy(true) }
    end

    describe ".full_name" do
      user = FactoryGirl.create(:hatchy_user, :without_bank_data)
      it "Should return user full name" do 
        expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
      end
    end

  end
end