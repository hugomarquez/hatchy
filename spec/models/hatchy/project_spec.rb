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

    describe "#total_contributors" do 
      it "Should count all contributions" do 
        user = FactoryGirl.create(:hatchy_user,:without_bank_data)
        contribution = FactoryGirl.create(:hatchy_contribution,:without_project, :without_user, :without_reward)
        contribution.user = user
        contribution.project = project
        contribution.save
        project.save
        expect(project.total_contributors).to eq 1
      end
    end

    describe "#total_contributions" do 
      it "Should sum all contributions values that are pending" do 
        user = FactoryGirl.create(:hatchy_user,:without_bank_data)
        contribution = FactoryGirl.create(:hatchy_contribution,:without_project, :without_user, :without_reward)
        contribution.user = user
        contribution.project = project
        contribution.save
        project.save
        expect(project.total_contributions).to eq 10.0
      end
    end

    describe "#total_percentage" do 
      it "Should calculate the percentage of money collected" do 
        user = FactoryGirl.create(:hatchy_user,:without_bank_data)
        contribution1 = FactoryGirl.create(:hatchy_contribution,:without_project, :without_user, :without_reward)
        contribution1.user = user
        contribution1.project = project
        contribution1.save
        project.save
        expect(project.total_percentage).to eq ((contribution1.value/project.goal) * 100 ).to_f
      end
    end

  end
end