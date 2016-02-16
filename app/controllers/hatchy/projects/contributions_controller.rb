module Hatchy
  class Projects::ContributionsController < ApplicationController
    before_action :set_project, only:[:new, :edit, :create, :update]
    before_action :set_contribution, only:[:edit, :update]

    def new
      @contribution = @project.contributions.build
      @rewards = @project.rewards.order(:min_value)
      @selected_reward = @project.rewards.find(params[:reward_id]) if params[:reward_id]
      if @selected_reward.present?
        @contribution.reward = @selected_reward
      end
    end

    def edit
      @user = current_user
      @countries = Hatchy::Country.all
    end

    def create
      @contribution = @project.contributions.new(contribution_params)
      @contribution.user = current_user
      @contribution.update_billing_info
      if @contribution.valid?
        @contribution.save
        redirect_to edit_project_contribution_path(@project, @contribution), notice: "Contribution saved successfully"
      else
        redirect_to project_path(@contribution.project)
        flash[:error] = @contribution.errors.full_messages.to_sentence
      end
    end

    def update
      @contribution.ip_address = request.remote_ip
      @contribution.update_user_billing_info
      if @contribution.update(contribution_params)
        redirect_to edit_project_contribution_path(@project, @contribution, anchor: params[:anchor]), notice: 'Contribution was successfully updated.'
      else
        render :edit
        flash[:error] = @contribution.errors.full_messages.to_sentence
      end
    end

    private
    def set_project
      @project = Hatchy::Project.find(params[:project_id])
    end

    def set_contribution
      @contribution = Hatchy::Contribution.find(params[:id])
    end
    
    def contribution_params
      params[:contribution].permit(
        :address_city,      :address_number,      :address_phone,
        :address_state,     :address_street,      :address_zip,
        :anonymous,         :country_id,          :document,
        :email,             :name,                :notified_when_finish,
        :project,           :reward_id,           :user,
        :value,             :card_type,           :card_expires_on,
        :card_number,       :card_verification,   :step
      )
    end

  end
end