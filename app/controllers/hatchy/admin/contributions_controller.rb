module Hatchy
  class Admin::ContributionsController < Admin::ApplicationController
    before_action :set_contribution, only: [:show]

    # GET /contributions
    def index
      respond_to do |format|
        format.html
        format.json { render json: Hatchy::ContributionsDatatable.new(view_context) }
      end
    end
    
    # GET /contribution/:id
    def show
    end

    private
    def set_contribution
      @contribution = Hatchy::Contribution.find(params[:id])
    end
  end
end