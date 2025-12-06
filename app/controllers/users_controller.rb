class UsersController < ApplicationController
  before_action :authenticate_user! # ログイン必須
  before_action :set_user, only: [:show, :destroy]

  # 他ユーザーのプロフィール
  def show
    @posts = @user.posts
  end

  # 自分用マイページ
  def my_page
    @user = current_user
    @posts = @user.posts.order(created_at: :desc)
  end

  # 投稿者名編集フォーム
  def edit_name
    @user = current_user
  end

  # 投稿者名更新処理
  def update_name
    @user = current_user
    if @user.update(user_params)
      redirect_to my_page_path, notice: "投稿者名を更新しました"
    else
      render :edit_name
    end
  end

  # 退会処理（物理削除）
  def destroy
    @user.destroy
    reset_session  # サインアウト
    redirect_to new_user_registration_path, notice: "退会しました"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
