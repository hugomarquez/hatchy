module Hatchy
  class Categories::SubscriptionsController < ApplicationController
  	before_filter :authenticate_user!
		before_action :set_category

		def create
			if current_user.categories.where(id: @category.id).present?
				redirect_to root_path(category_id: @category.id)
				flash[:notice] = "You are already following #{@category.name}"
			else
				@category.users << current_user
				redirect_to root_path(category_id: @category.id)
				flash[:success] = "You are now following #{@category.name}"
			end
		end

		def destroy
			@category.users.delete(current_user)
			redirect_to root_path(category_id: @category.id)
			flash[:notice] = "You unfollowed #{@category.name}"
		end

		private
		def set_category
			@category ||= Category.find(params[:id])
		end
		
  end
end