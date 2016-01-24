module Hatchy
  RSpec.describe ProjectPost, type: :model do
    let(:post){create(:hatchy_post)}
    
    describe "associations" do
    	it{ is_expected.to belong_to :project}
      it{ is_expected.to belong_to :user}
    end

    describe "validations" do 
      it { should validate_presence_of(:user) }
      it { should validate_presence_of(:project) }
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:content) }
    end

  end
end
