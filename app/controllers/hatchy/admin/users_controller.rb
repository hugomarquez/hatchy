module Hatchy
  class Admin::UsersController < Admin::ApplicationController
    before_action :set_user, only: [:edit, :show, :update, :destroy]

    # GET /users
    def index
      respond_to do |format|
        format.html
        format.json { render json: Hatchy::UsersDatatable.new(view_context) }
      end
    end

    # GET /user/:id/edit
    def edit
    end

    # GET /user/:id
    def show
    end
    
    # PATCH /user/:id
    # PUT /user/:id
    def update
      if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
      else
        render :edit
        flash[:error] = @user.errors.full_messages.to_sentence
      end
    end

    # DELETE /user/1
    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: 'User was successfully destroyed.'
    end

    private
    def set_user
      @user = Hatchy::User.find(params[:id])
    end

    def user_params
      params[:user].permit(:first_name, :last_name)
    end
  end
end