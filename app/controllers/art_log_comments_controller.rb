class ArtLogCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    art_log_comment = ArtLogComment.new(art_log_comment_params)
    art_log_comment.user_id = current_user.id
    art_log_comment.art_log_id = params[:art_log_id]
    if art_log_comment.save
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def art_log_comment_params
      params.fetch(:art_log_comment, {}).permit(:body)
    end
end
