class ExhbClipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exhibition

  def create
    ExhbClip.create(user_id: current_user.id, exhibition_id: params[:exhibition_id])
  end

  def destroy
    ExhbClip.find(params[:id]).destroy
  end

  private

    def set_exhibition
      @exhb = Exhibition.find(params[:exhibition_id])
    end
end
