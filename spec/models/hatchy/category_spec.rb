require 'rails_helper'
module Hatchy
  RSpec.describe Category, type: :model do
    let(:category){ create(:hatchy_category) }

    describe "associations" do 
      it{ is_expected.to have_many :projects }
      it{ is_expected.to have_many :category_followers }
      it{ is_expected.to have_many(:users).through(:category_followers) }
    end

    describe "validations" do 
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }
    end

    describe "#total_projects" do 
      it "should count all projects in a category that are online" do 
        project = FactoryGirl.create(:hatchy_project, :without_category)
        project.send_to_analysis
        project.send_to_approved
        project.push_to_online
        project.category = category
        project.save
        expect(category.total_projects).to eq 1
      end
    end

  end
end