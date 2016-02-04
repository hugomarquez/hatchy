module Hatchy
  class Users::ContributionsController < ApplicationController
  	before_action :set_project, only:[:new, :edit, :create, :update]
    before_action :set_contribution, only:[:edit, :update]

  	def index
  		@active = Hatchy::Contribution.where(user: current_user).joins(:project).where('hatchy_projects.status': 'online')
  		@collected = Hatchy::Contribution.where(user: current_user).joins(:project).where('hatchy_projects.status': 'successful')
  	end

  end
end
