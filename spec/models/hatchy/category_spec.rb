require 'rails_helper'
module Hatchy
  RSpec.describe Category, type: :model do
    let(:category){ FactoryGirl.create(:hatchy_category) }
    let(:project){ FactoryGirl.create(:hatchy_project) }

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
        online = FactoryGirl.create(:hatchy_project, :without_category, :without_user)
        online_acc = FactoryGirl.create(:hatchy_project_account, :without_project)
        online.category = category
        online.send_to_analysis
        online.send_to_approved
        online.account = online_acc
        online.save
        online.push_to_online
        online.save
        expect(category.total_projects).to eq 1
      end
    end

    describe ".with_projects" do 
      it "Should query all projects not(draft or rejected) that belongs to a category" do 
        project_acc = FactoryGirl.create(:hatchy_project_account, :without_project)
        project.category = category
        project.send_to_analysis
        project.send_to_approved
        project.account = project_acc
        project.save
        project.push_to_online
        project.save
        expect(Hatchy::Category.with_projects).to_not be_empty
      end
    end

  end
end