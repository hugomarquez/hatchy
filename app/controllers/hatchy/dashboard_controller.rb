module Hatchy
  class DashboardController < ApplicationController
    def index
      @my_projects = current_user.projects
    end
  end
end
