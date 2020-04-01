class ArtLogLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    art_log_like = ArtLogLike.new(user_id: current_user.id, art_log_id: params[:art_log_id])
    if art_log_like.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    ArtLogLike.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
