module Hatchy
  class AnnouncementsController < ApplicationController
    skip_before_filter :authenticate_user!, only: [:hide]
    
    def hide
      ids = [params[:id], *cookies.signed[:hidden_announcement_ids]]
      cookies.permanent.signed[:hidden_announcement_ids] = ids
      redirect_to :back
    end    
  end
end