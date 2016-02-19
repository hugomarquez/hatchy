module Hatchy
  def self.policy_class
    Admin::ApplicationPolicy
  end
  
  class Admin::ApplicationController < ActionController::Base
    include Pundit
    before_filter :authenticate_user!
    before_filter :authorize_admin!
    layout 'hatchy/admin/admin_layout'
    protect_from_forgery

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protected
    def authorize_admin!
      authorize Hatchy, :access?
    end

    def policy(record)
      Hatchy.policy_class.new(current_user, record)
    end

    def user_not_authorized
      flash[:error] = t('controllers.hatchy.admin.application.not_authorized')
      redirect_to request.headers["Referer"] || root_path
    end

  end
end