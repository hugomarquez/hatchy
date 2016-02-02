module Hatchy
  class Admin::ContributionsController < Admin::ApplicationController
    before_action :set_contribution, only: [:show, :destroy]

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

    # DELETE /contribution/:id
    def destroy
      @contribution.destroy
      redirect_to admin_contributions_path, notice: 'Contribution was successfully destroyed.'
    end

    private
    def set_contribution
      @contribution = Hatchy::Contribution.find(params[:id])
    end
  end
end