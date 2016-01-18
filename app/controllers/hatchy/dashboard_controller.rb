module Hatchy
  class DashboardController < ApplicationController
    def index
      @my_projects = current_user.projects
      @contributions = current_user.contributions
    end
  end
end
