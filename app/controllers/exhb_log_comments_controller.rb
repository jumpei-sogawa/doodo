class ExhbLogCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    exhb_log_comment = ExhbLogComment.new(exhb_log_comment_params)
    exhb_log_comment.user_id = current_user.id
    exhb_log_comment.exhb_log_id = params[:exhb_log_id]
    if exhb_log_comment.save
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def exhb_log_comment_params
      params.fetch(:exhb_log_comment, {}).permit(:body)
    end
end
