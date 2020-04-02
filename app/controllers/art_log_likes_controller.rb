class ArtLogLikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_art_log

  def create
    ArtLogLike.create(user_id: current_user.id, art_log_id: params[:art_log_id])
  end

  def destroy
    ArtLogLike.find(params[:id]).destroy
  end

  private

    def set_art_log
      @art_log = ArtLog.find(params[:art_log_id])
    end
end
