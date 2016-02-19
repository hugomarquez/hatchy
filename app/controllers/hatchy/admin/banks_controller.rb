module Hatchy
  class Admin::BanksController < Admin::ApplicationController
    before_action :set_bank, only: [:edit, :show, :update, :destroy]

    # GET /banks
    def index
      @banks = Hatchy::Bank.order(:created_at)
    end

    # GET /bank/new
    def new
      @bank = Hatchy::Bank.new
    end

    # GET /bank/:id/edit
    def edit
    end

    # GET /bank/:id
    def show
    end

    # POST /bank
    def create
      @bank = Hatchy::Bank.new(bank_params)
      if @bank.valid?
        @bank.save
        redirect_to admin_bank_path(@bank), notice:t('controllers.hatchy.admin.banks.create.notice')
      else
        render :new
      end
    end
    
    # PATCH /bank/:id
    # PUT /bank/:id
    def update
      if @bank.update(bank_params)
        redirect_to admin_bank_path(@bank), notice:t('controllers.hatchy.admin.banks.update.notice')
      else
        render :edit
        flash[:error] = @bank.errors.full_messages.to_sentence
      end
    end

    # DELETE /bank/1
    def destroy
      @bank.destroy
      redirect_to admin_banks_path, notice:t('controllers.hatchy.admin.banks.destroy.notice')
    end

    private
    def set_bank
      @bank = Hatchy::Bank.find(params[:id])
    end

    def bank_params
      params[:bank].permit(:name, :code)
    end

  end
end