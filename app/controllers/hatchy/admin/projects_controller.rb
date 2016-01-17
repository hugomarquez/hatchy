module Hatchy
  class Admin::ProjectsController < Admin::ApplicationController
    before_action :set_project, only: [:edit, :show, :update, :destroy]
    # GET /projects
    def index
      respond_to do |format|
        format.html
        format.json { render json: Hatchy::ProjectsDatatable.new(view_context) }
      end
    end

    # GET /project/:id
    def show
    end

    private
    def set_project
      @project = Hatchy::Project.find(params[:id])
    end

    def project_params
      params[:project].permit(:name, :status)
    end
  end
end