require 'rails_helper'
module Hatchy
  RSpec.describe Project, type: :model do
    let(:project){create(:hatchy_project)}

    describe "associations" do
        it{ is_expected.to have_many :rewards}
        it{ is_expected.to have_many :contributions}
        it{ is_expected.to have_one  :account}
        it{ is_expected.to belong_to :user}
        it{ is_expected.to belong_to :category}
    end

    describe "core validations" do 
        it { should validate_presence_of(:name)}
      it { should validate_uniqueness_of(:name)}
      it { should accept_nested_attributes_for(:rewards).allow_destroy(true)}
    end

    describe "#video" do
        it "Should return iframe html code" do 
            expect(project.video).to start_with "<iframe"
        end
    end

  end
end