module Hatchy
  class Admin::CountriesController < Admin::ApplicationController
    before_action :set_country, only: [:edit, :show, :update, :destroy]

    # GET /countries
    def index
      @countries = Hatchy::Country.order(:name)
    end

    # GET /country/new
    def new
      @country = Hatchy::Country.new
    end

    # GET /country/:id/edit
    def edit
    end

    # GET /country/:id
    def show
    end

    # POST /country
    def create
      @country = Hatchy::Country.new(country_params)
      if @country.valid?
        @country.save
        redirect_to admin_country_path(@country), notice:t('controllers.hatchy.admin.countries.create.notice')
      else
        render :new
      end
    end
    
    # PATCH /country/:id
    # PUT /country/:id
    def update
      if @country.update(country_params)
        redirect_to admin_country_path(@country), notice:t('controllers.hatchy.admin.countries.update.notice')
      else
        render :edit
        flash[:error] = @country.errors.full_messages.to_sentence
      end
    end

    # DELETE /country/1
    def destroy
      @country.destroy
      redirect_to admin_countries_path, notice:t('controllers.hatchy.admin.countries.destroy.notice')
    end

    private
    def set_country
      @country = Hatchy::Country.find(params[:id])
    end

    def country_params
      params[:country].permit(:name, :code2, :code3, :continent, :tld, :currency, :eu_member)
    end

  end
end