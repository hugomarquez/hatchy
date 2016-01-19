require 'rails_helper'

module Hatchy
  RSpec.describe Contribution, type: :model do
  	let(:contriution){create(:hatchy_contribution)}
  	
  	describe "associations" do
      it{ is_expected.to belong_to :user}
      it{ is_expected.to belong_to :reward}
      it{ is_expected.to belong_to :project}
      it{ is_expected.to belong_to :country}
    end
  end
end
