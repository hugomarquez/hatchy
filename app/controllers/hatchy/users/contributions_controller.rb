module Hatchy
  class Users::ContributionsController < ApplicationController
    before_action :set_project, only:[:new, :edit, :create, :update]
    before_action :set_contribution, only:[:edit, :update]

    def index
      @active = Hatchy::Contribution.active_pledges(current_user)
      @collected = Hatchy::Contribution.collected_pledges(current_user)
    end

  end
end
