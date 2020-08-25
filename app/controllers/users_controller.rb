class UsersController < ApplicationController

  def index
    @users = User.all.order(nickname: "DESC")
  end

  def search
    @users = User.search(params[:keyword])
  end

  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to users_path
  end
#フォローする

  def unfollow
      @user = User.find(params[:user_id])
      current_user.stop_following(@user)
      redirect_to users_path
  end
  #フォローを外す


  def follow_list
    @user = User.find(params[:user_id])
  end
  #フォローしてる人の一覧ページ

  def follower_list
    @user = User.find(params[:user_id])
  end
  #フォロワーの一覧ページ
end

