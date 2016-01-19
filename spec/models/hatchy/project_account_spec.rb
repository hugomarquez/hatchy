require 'rails_helper'

module Hatchy
  RSpec.describe ProjectAccount, type: :model do
    let(:account){ create(:hatchy_project_account) }

    describe "associations" do 
        it{ is_expected.to belong_to :bank }
        it{ is_expected.to belong_to :project }
    end

    describe "validations" do 
        it { should validate_presence_of(:address_street)}
        it { should validate_presence_of(:address_number)}
        it { should validate_presence_of(:address_city)}
        it { should validate_presence_of(:address_state)}
        it { should validate_presence_of(:address_zip)}
        it { should validate_presence_of(:account_type)}
        it { should validate_presence_of(:email)}
        it { should validate_presence_of(:phone)}
        it { should validate_presence_of(:account)}
        it { should validate_presence_of(:account_digit)}
        it { should validate_presence_of(:owner_name)}
        it { should validate_presence_of(:owner_document)}
    end

  end
end