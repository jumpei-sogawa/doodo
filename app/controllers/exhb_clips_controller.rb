class ExhbClipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @exhb_clip = ExhbClip.new(user: current_user, exhibition_id: params[:exhibition_id])
    if @exhb_clip.save
      redirect_to exhibition_path(params[:exhibition_id])
    end
  end

  def destroy
    @exhb_clip = ExhbClip.find_by(user: current_user, exhibition_id: params[:exhibition_id])
    ExhbClip.find(params[:id]).destroy
    redirect_to exhibition_path(params[:exhibition_id])
  end

end
