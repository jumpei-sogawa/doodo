class ArtLogCommentsController < ApplicationController

  def create
    if art_log_comment_params[:body].blank?
      redirect_to art_log_path(art_log_comment.art_log)
    end

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

  def destroy
    art_log_comment = ArtLogComment.find(params[:id])
    unless user_signed_in?
      redirect_to session[:previous_url]
    end
    if art_log_comment.user.id != current_user.id
      redirect_to session[:previous_url]
    end
    art_log_comment.destroy
    redirect_to art_log_path(params[:art_log_id])
  end

  private
    def art_log_comment_params
      params.fetch(:art_log_comment, {}).permit(:body)
    end
end
