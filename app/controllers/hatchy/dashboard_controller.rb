module Hatchy
  class DashboardController < ApplicationController
    def index
      @my_projects = Hatchy::Project.user_recent(current_user)
      @contributions = Hatchy::Contribution.user_recent(current_user)
    end
  end
end
