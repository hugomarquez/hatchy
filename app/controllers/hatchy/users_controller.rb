module Hatchy
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    after_action :verify_authorized, except:[:show]

    # GET users/:id
    def show
    end

    # GET /users/:id/edit
    def edit
      authorize @user
      @user.build_bank_account unless @user.bank_account
    end

    # PATCH /users/:id
    # PUT /users/:id
    def update
      authorize @user
      if @user.update(user_params)
        redirect_to edit_user_path(@user, anchor: params[:anchor]), notice:'User was successfully updated.'
      else
        render :edit
      end
    end

    private

    def user_params
      params[:user].permit(
        :country_id, :address_state, :address_city,
        :address_zip,:address_street, :address_number,
        :document, :phone, :mobile, :subs_projects,
        :first_name, :last_name, :locale, :newsletter, :profile_img, 
        :cover_img, :facebook_link, :twitter_link, 
        :other_link, :about,
        bank_account_attributes:
          [:bank_id, :user_id, :account, :account_digit]
      )
    end

    def set_user
      @user = Hatchy::User.find(params[:id])
    end

  end
end