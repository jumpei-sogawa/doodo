class ExhbLogLikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exhb_log

  def create
    ExhbLogLike.create(user_id: current_user.id, exhb_log_id: params[:exhb_log_id])
  end

  def destroy
    ExhbLogLike.find(params[:id]).destroy
  end

  private

    def set_exhb_log
      @exhb_log = ExhbLog.find(params[:exhb_log_id])
    end
end
