module Hatchy
  class Projects::ContributionsController < ApplicationController
    before_action :set_resources, only: [:new, :create]

    def new 
      @contribution = Hatchy::Contribution.new(project: @project)
      empty_reward = Hatchy::Reward.new(min_value: 10.0, description: 'No reward contributions')
      @rewards = [empty_reward] + @project.rewards.order(:min_value) #Bring remaining rewards from project
      @selected_reward = @project.rewards.find(params[:reward_id]) if params[:reward_id]
      if @selected_reward.present?
        @contribution.reward = @selected_reward
      end
    end

    def create
      @contribution = Hatchy::Contribution.new(contribution_params)
      @contribution.ip_address = request.remote_ip
      @contribution.user = @user
      @contribution.project = @project
      @selected_reward = @project.rewards.find(params[:reward_id]) if params[:reward_id]
      if @selected_reward.present?
        @contribution.reward = @selected_reward
      end

      if @contribution.valid?
        @contribution.save
        redirect_to project_path(@project)
        flash[:notice] = "Contribution created successfully"
      else
        redirect_to new_project_contribution_path
        flash[:error] = @contribution.errors.full_messages.to_sentence
      end
    end

    def review
      current_user.build_bank_account unless current_user.bank_account
    end

    private
    
    def contribution_params
      params[:contribution].permit(
        :address_city,      :address_number,      :address_phone,
        :address_state,     :address_street,      :address_zip,
        :anonymous,         :country_id,          :document,
        :email,             :name,                :notified_when_finish,
        :project,           :reward_id,           :user,
        :value,             :card_type,           :card_expires_on,
        :card_number,       :card_verification
      )
    end

    def set_resources
      @project = Hatchy::Project.find(params[:project_id])
      @user = current_user if current_user
      @countries = Hatchy::Country.order(:name)
    end

  end
end