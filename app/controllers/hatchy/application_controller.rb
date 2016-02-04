module Hatchy
  class ApplicationController < ActionController::Base
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_filter :authenticate_user!
    protect_from_forgery

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private
    def user_not_authorized
      flash[:error] = "You are not authorized to perform this action."
      redirect_to request.headers["Referer"] || root_path
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
    end
    
  end
end
