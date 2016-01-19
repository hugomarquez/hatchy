require 'rails_helper'
module Hatchy
  RSpec.describe Country, type: :model do
    let(:country){ create(:hatchy_country) }
    
    describe "associations" do 
      it{ is_expected.to have_many :users }
    end
  end
end