module Hatchy
  class DashboardController < ApplicationController
    def index
      @my_projects = current_user.projects
      @supported_projects = nil
    end
  end
end
