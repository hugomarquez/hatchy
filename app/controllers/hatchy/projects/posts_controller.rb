module Hatchy
  class Projects::PostsController < ApplicationController
    skip_before_filter :authenticate_user!, only: [:show]
  	before_action :set_project, only:[:show, :destroy]
  	before_action :set_post, only:[:show, :destroy]

  	def show
  	end
  	
  	def destroy
  		@post.destroy
  		redirect_to edit_project_path(@project, anchor: 'post')
  		flash[:notice] = "Post was successfully destroyed."
  	end

  	private
  	def set_project
  		@project = Hatchy::Project.find(params[:project_id])
  	end

  	def set_post
  		@post = @project.posts.find(params[:id])
  	end
  end
end
