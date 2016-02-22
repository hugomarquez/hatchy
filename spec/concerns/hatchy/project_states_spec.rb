require 'rails_helper'
module Hatchy
  RSpec.describe ProjectStates do
    let(:project){create(:hatchy_project)}
    
    context "draft" do 
      subject{ project }
      it { should validate_presence_of(:city) }

      describe "#send_to_draft" do 
        it "should change project status to draft" do 
          expect(project.status).to eq "draft"
        end

        it "should set/update send_to_draft_at datetime attribute" do 
          expect(project.send_to_draft_at.day).to eq Time.now.day
        end
      end

      describe "#send_to_analysis" do
        it "should change project status to analysis" do 
          expect(project.send_to_analysis).to eq "analysis"
        end

        it "should not change project status to analysis" do 
          project.status = "rejected"
          expect(project.send_to_analysis).to_not eq "analysis"
        end
      end

      describe "#push_to_trash" do 
        it "should change project status to trash" do 
          project.status = "draft"
          expect(project.push_to_trash).to eq "trash"
        end
      end

      describe "#push_to_online" do 
        it "should not change project status to online" do 
          project.status = "draft"
          expect(project.push_to_online).to_not eq "online"
        end
      end

      describe "#draft?" do 
        it "should return true if project status is draft" do 
          expect(project.draft?).to eq true
        end
      end

      describe "#safe_params" do 
        it "should return array of safe parameters" do 
          expect(project.safe_params).to be_kind_of(Array)
        end
      end
    end

    context "analysis" do
      analysis = FactoryGirl.create(:hatchy_project, :without_category, :without_user)
      analysis.send_to_analysis
      analysis.project_img.remove!
      
      subject{analysis}
      
      it { should validate_presence_of(:about)}
      it { should validate_presence_of(:headline)}
      it { should validate_presence_of(:goal)}
      it { should validate_presence_of(:online_days)}
      it { should validate_presence_of(:budget)}
      it { should validate_presence_of(:project_img)}

      describe "#analysis?" do 
        it "shoud return true if project status is analysis" do 
          expect(analysis.analysis?).to eq true
        end
      end

      describe "#safe_params" do 
        it "should return array of safe_params" do 
          expect(analysis.safe_params).to be_kind_of(Array)
        end
      end

      describe "#send_to_approved" do 
        it "should change project status to approved" do 
          expect(analysis.send_to_approved).to eq "approved"
        end
        it "should not change project status to approved" do 
          analysis.status = "rejected"
          expect(analysis.send_to_approved).to_not eq "approved"
        end
      end

      describe "#send_to_rejected" do 
        it "should change project status to rejected" do 
          analysis.status = "analysis"
          analysis.send_to_rejected
          expect(analysis.status).to eq "rejected"
        end

        it "should not change project status to rejected" do 
          analysis.status = "approved"
          expect(analysis.send_to_rejected).to_not eq "rejected"
        end
      end

      describe "#push_to_trash" do 
        it "should change project status to trash" do 
          analysis.status = "analysis"
          expect(analysis.push_to_trash).to eq "trash"
        end
      end

    end

    context "approved" do 
      approved = FactoryGirl.create(:hatchy_project, :without_category, :without_user)
      approved.send_to_analysis
      approved.send_to_approved
      approved.project_img.remove!
      subject{approved}

      it { should validate_presence_of(:about)}
      it { should validate_presence_of(:headline)}
      it { should validate_presence_of(:goal)}
      it { should validate_presence_of(:online_days)}
      it { should validate_presence_of(:budget)}
      it { should validate_presence_of(:project_img)}
      it { should validate_presence_of(:video_url)}

      describe "#push_to_online" do 
        it "should change project status to online" do 
          approved.online_days = 60
          approved.push_to_online
          expect(approved.status).to eq "online"
        end
      end

      describe "#approved" do 
        it "should return true if project status is approved" do 
          approved.status = "approved"
          expect(approved.approved?).to eq true
        end
      end
    end

    context "online" do 
      online = FactoryGirl.create(:hatchy_project, :without_category, :without_user)
      online.send_to_analysis
      online.send_to_approved
      online.push_to_online
      online.project_img.remove!
      subject{online}

      it { should validate_presence_of(:about)}
      it { should validate_presence_of(:headline)}
      it { should validate_presence_of(:goal)}
      it { should validate_presence_of(:online_days)}
      it { should validate_presence_of(:budget)}
      it { should validate_presence_of(:project_img)}
      it { should validate_presence_of(:video_url)}
      it { should validate_presence_of(:account)}

      describe "#safe_params" do 
        it "should return array of safe_params" do 
          expect(online.safe_params).to be_kind_of(Array)
        end
      end
      
      describe "#push_to_trash" do 
        it "should not change project status to deleted" do 
          expect(online.push_to_trash).to_not eq "trash"
        end
      end
    end

    context "rejected" do 
      describe "#rejected?" do 
        it "should return true if project status is rejected" do 
          project.status = "rejected"
          expect(project.rejected?).to eq true  
        end
      end
    end

    context "trash" do 
      describe "#trash?" do 
        it "should return true if project status is trash" do 
          project.status = "trash"
          expect(project.trash?).to eq true 
        end
      end
    end

    context "failed" do 
      failed = FactoryGirl.create(:hatchy_project, :without_category, :without_user)
      failed.send_to_analysis
      failed.send_to_approved
      failed.push_to_online
      failed.project_img.remove!
      failed.status = "failed"
      subject{failed}

      it { should validate_presence_of(:about)}
      it { should validate_presence_of(:headline)}
      it { should validate_presence_of(:goal)}
      it { should validate_presence_of(:online_days)}
      it { should validate_presence_of(:budget)}
      it { should validate_presence_of(:project_img)}
      it { should validate_presence_of(:video_url)}
      it { should validate_presence_of(:account)}

      describe "#failed?" do 
        it "should return true if project status is failed" do 
          expect(failed.failed?).to eq true 
        end
      end
    end

    context "successful" do 
      success = FactoryGirl.create(:hatchy_project, :without_category, :without_user)
      success.send_to_analysis
      success.send_to_approved
      success.push_to_online
      success.project_img.remove!
      success.status = "successful"
      subject{success}

      it { should validate_presence_of(:about)}
      it { should validate_presence_of(:headline)}
      it { should validate_presence_of(:goal)}
      it { should validate_presence_of(:online_days)}
      it { should validate_presence_of(:budget)}
      it { should validate_presence_of(:project_img)}
      it { should validate_presence_of(:video_url)}
      it { should validate_presence_of(:account)}
      
      describe "#successful?" do 
        it "should return true if project status is success?" do 
          expect(success.successful?).to eq true  
        end
      end
    end

  end
end