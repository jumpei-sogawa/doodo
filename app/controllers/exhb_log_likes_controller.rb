class ExhbLogLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    exhb_log_like = ExhbLogLike.new(user_id: current_user.id, exhb_log_id: params[:exhb_log_id])
    if exhb_log_like.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    ExhbLogLike.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
