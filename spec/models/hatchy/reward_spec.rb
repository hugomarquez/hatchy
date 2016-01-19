require 'rails_helper'
module Hatchy
  RSpec.describe Reward, type: :model do
    let(:reward){create(:hatchy_reward)}
    describe "associations" do
      it{ is_expected.to have_many :contributions}
      it{ is_expected.to belong_to :project}
    end
  end
end
