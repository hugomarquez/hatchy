module Hatchy
  class Admin::DashboardController < Admin::ApplicationController
    def index
      @models = [
        Hatchy::Announcement.order(updated_at: :desc).first,
        Hatchy::Bank.order(updated_at: :desc).first,
        Hatchy::Category.order(updated_at: :desc).first,
        Hatchy::Contribution.order(updated_at: :desc).first,
        Hatchy::Project.order(updated_at: :desc).first,
        Hatchy::Reward.order(updated_at: :desc).first,
        Hatchy::User.order(updated_at: :desc).first,
      ]
    end
  end
end