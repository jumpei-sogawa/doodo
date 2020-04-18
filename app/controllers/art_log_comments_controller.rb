class ArtLogCommentsController < ApplicationController

  def create
    if user_signed_in?
      art_log_comment = ArtLogComment.new(art_log_comment_params)
      art_log_comment.user_id = current_user.id
      art_log_comment.art_log_id = params[:art_log_id]
      if art_log_comment.save
        session[:art_log_comment_body] = nil
        redirect_back(fallback_location: root_path)
      end
    else
      session[:art_log_comment_body] = params[:art_log_comment][:body]
      redirect_to new_user_session_path
    end
  end

  private
    def art_log_comment_params
      params.fetch(:art_log_comment, {}).permit(:body)
    end
end
