class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.with_attached_image.find_newest_posts(params[:page]).per(6)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "ナッツを登録しました!"
    else
      render :new
    end
  end

  def show
    @post = Post.with_attached_image.includes(comments: :user).find(params[:id])
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "ナッツの情報を更新しました!"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "ナッツを削除しました｡"
  end

  private

    def post_params
      params.require(:post).permit(:title, :description, :new_image, :nut_id, :genre_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
