require 'rails_helper'
module Hatchy
  RSpec.describe Announcement, type: :model do
    let!(:announcement){FactoryGirl.create(:hatchy_announcement)}

    describe ".current" do 
        it "Should query announcements in time" do 
            expect(Hatchy::Announcement.current.first).to eq announcement
        end
        it "Should query announcements in time  and not in hidden list" do 
            expect(Hatchy::Announcement.current(announcement)).to be_empty
        end
    end

  end
end