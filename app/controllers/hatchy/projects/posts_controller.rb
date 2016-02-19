module Hatchy
  class Projects::PostsController < ApplicationController
    skip_before_filter :authenticate_user!, only: [:show]
  	before_action :set_project, only:[:show, :edit, :update, :destroy]
  	before_action :set_post, only:[:show, :edit, :update, :destroy]

  	def show
  	end
    
    def edit
    end

    def update
      if @post.update(post_params)
        redirect_to project_post_path(@project, @post), notice: t('controllers.hatchy.projects.posts.update.notice')
      else
        redirect_to edit_project_post_path(@project, @post)
        flash[:error] = @post.errors.full_messages.to_sentence
      end
    end
  	
  	def destroy
  		@post.destroy
  		redirect_to edit_project_path(@project, anchor: 'post')
  		flash[:notice] = t('controllers.hatchy.projects.posts.destroy.notice')
  	end

  	private
  	def set_project
  		@project = Hatchy::Project.find(params[:project_id])
  	end

  	def set_post
  		@post = @project.posts.find(params[:id])
  	end

    def post_params
      params[:project_post].permit(:title, :content, :private)
    end
  end
end
