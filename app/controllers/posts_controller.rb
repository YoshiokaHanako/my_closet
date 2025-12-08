class PostsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to my_page_path, notice: "投稿が保存されました"  # マイページに遷移
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @post.update(post_params)
      redirect_to my_page_path, notice: "投稿を更新しました"  # マイページに遷移
    else
      flash.now[:alert] = "必須項目を入力してください"
      render :edit
    end
  end


  def destroy
    @post.destroy
    redirect_to my_page_path, notice: "投稿を削除しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user
    unless @post.user == current_user
      redirect_to posts_path, alert: "他のユーザーの投稿は編集・削除できません"
    end
  end

  def post_params
    params.require(:post).permit(:item_name, :content, :category_id, :image)
  end
end
