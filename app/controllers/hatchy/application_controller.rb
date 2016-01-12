module Hatchy
  class ApplicationController < ActionController::Base
  	before_filter :authenticate_user!
  	protect_from_forgery

  	private
  	def user_not_authorized
    	flash[:error] = "You are not authorized to perform this action."
    	redirect_to request.headers["Referer"] || root_path
  	end
  	
  end
end
