module Hatchy
  class HomeController < ApplicationController
    skip_before_filter :authenticate_user!, only: [:index, :explore]
    
    def index
    	@recommended_projects = Hatchy::Project.recommended
    end

    def explore
    	@categories = Hatchy::Category.with_projects.order(:name).all
    	if params[:category_id]
    		@projects ||= Hatchy::Project.online_category(params[:category_id])
      else
        @projects ||= Hatchy::Project.recent
    	end

      @category_id ||= params[:category_id]
    end

  end
end
