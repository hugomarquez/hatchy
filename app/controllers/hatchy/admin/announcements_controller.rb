module Hatchy
  class Admin::AnnouncementsController < Admin::ApplicationController
    before_action :set_announcement, only: [:edit, :show, :update, :destroy]

    # GET /announcements
    def index
      @announcements = Hatchy::Announcement.order(:created_at)
    end

    # GET /announcement/new
    def new
      @announcement = Hatchy::Announcement.new
    end

    # GET /announcement/:id/edit
    def edit
    end

    # GET /announcement/:id
    def show
    end

    # POST /announcement
    def create
      @announcement = Hatchy::Announcement.new(announcement_params)
      if @announcement.valid?
        @announcement.save
        redirect_to admin_announcement_path(@announcement), notice:t('controllers.hatchy.admin.announcements.create.notice')
      else
        render :new
      end
    end
    
    # PATCH /announcement/:id
    # PUT /announcement/:id
    def update
      if @announcement.update(announcement_params)
        redirect_to admin_announcement_path(@announcement), notice:t('controllers.hatchy.admin.announcements.update.notice')
      else
        render :edit
        flash[:error] = @announcement.errors.full_messages.to_sentence
      end
    end

    # DELETE /announcement/1
    def destroy
      @announcement.destroy
      redirect_to admin_announcements_path, notice:t('controllers.hatchy.admin.announcements.destroy.notice')
    end

    private
    def set_announcement
      @announcement = Hatchy::Announcement.find(params[:id])
    end

    def announcement_params
      params[:announcement].permit(:message, :starts_at, :ends_at)
    end

  end
end