require 'rails_helper'
module Hatchy
  RSpec.describe Bank, type: :model do
    let(:bank){ create(:bank) }

    describe "validations" do 
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:code) }
      it { should validate_uniqueness_of(:code) }
    end

  end
end