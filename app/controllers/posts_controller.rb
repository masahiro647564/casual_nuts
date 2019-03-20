class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
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
      params.require(:post).permit(:title, :description, :new_image)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
