class ExhbClipsController < ApplicationController
  before_action :authenticate_user!

  def create
    exhb_clip = ExhbClip.new(user_id: current_user.id, exhibition_id: params[:exhibition_id])
    if exhb_clip.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    ExhbClip.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
