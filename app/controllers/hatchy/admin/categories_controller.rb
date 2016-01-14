module Hatchy
  class Admin::CategoriesController < Admin::ApplicationController
    before_action :set_category, only: [:edit, :show, :update, :destroy]

    # GET /categories
    def index
      @categories = Hatchy::Category.order(:name)
    end

    # GET /category/new
    def new
      @category = Hatchy::Category.new
    end

    # GET /category/:id/edit
    def edit
    end

    # GET /category/:id
    def show
    end

    # POST /category
    def create
      @category = Hatchy::Category.new(category_params)
      if @category.valid?
        @category.save
        redirect_to admin_category_path(@category), notice: "Category saved successfully"
      else
        render :new
      end
    end
    
    # PATCH /category/:id
    # PUT /category/:id
    def update
      if @category.update(category_params)
        redirect_to admin_category_path(@category), notice: 'Category was successfully updated.'
      else
        render :edit
        flash[:error] = @category.errors.full_messages.to_sentence
      end
    end

    # DELETE /category/1
    def destroy
      @category.destroy
      redirect_to admin_categories_path, notice: 'Category was successfully destroyed.'
    end

    private
    def set_category
      @category = Hatchy::Category.find(params[:id])
    end

    def category_params
      params[:category].permit(:name)
    end

  end
end