class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def mypage
    redirect_to "/#{current_user.username}"
  end

  def show
    @title = "#{@user.username}のマイページ | アート・展覧会の感想を見るなら【doodo】"
    @description = "アート・展覧会の感想まとめサイト「doodo」の#{@user.username}のマイページです。doodoはアート・絵画・美術館・展覧会・美術展の感想が見れる検索サイトです。六本木、国立新美術館、上野、国立西洋美術館など、各地で開催されている展覧会の最新情報をご案内。"
    @visited_exhibitions = @user.visited_exhibitions.distinct.select { |exhb| exhb.id != 1}
    @clipped_exhibitions = @user.clipped_exhibitions.distinct.select { |exhb| exhb.id != 1}
    @exhb_logs = @user.exhb_logs.order(id: "DESC").first(24)
  end

  def edit
    if @user != current_user
      redirect_to "/#{@user.username}"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to "/#{@user.username}"
    else
      redirect_to "/#{@user.username}/edit"
    end
  end

  private

    def set_user
      @user = User.find_by(username: params[:username])
    end

    def user_params
      params.fetch(:user, {}).permit(:username, :name, :bio, :image)
    end
end
