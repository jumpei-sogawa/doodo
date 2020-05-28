class ExhbLogCommentsController < ApplicationController

  def create
    if exhb_log_comment_params[:body].blank?
      redirect_to exhb_log_path(exhb_log_comment.exhb_log)
    end

    if user_signed_in?
      exhb_log_comment = ExhbLogComment.new(exhb_log_comment_params)
      exhb_log_comment.user_id = current_user.id
      exhb_log_comment.exhb_log_id = params[:exhb_log_id]
      if exhb_log_comment.save
        session[:exhb_log_comment_body] = nil
        redirect_to exhb_log_path(exhb_log_comment.exhb_log)
      end
    else
      session[:exhb_log_comment_body] = params[:exhb_log_comment][:body]
      redirect_to new_user_session_path
    end
  end

  def destroy
    exhb_log_comment = ExhbLogComment.find(params[:id])
    if user_signed_in?
      if exhb_log_comment.user.id == current_user.id || current_user.email == "admin@doodo.jp"
        exhb_log_comment.destroy
        redirect_to exhb_log_path(params[:exhb_log_id])
      else
        redirect_to session[:previous_url] || root_path
      end
    else
      redirect_to session[:previous_url] || root_path
    end
  end

  private
    def exhb_log_comment_params
      params.fetch(:exhb_log_comment, {}).permit(:body)
    end
end
