class CommentsController < ApplicationController
  before_action :set_post, only: [:show, :new, :create, :edit]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.attributes = {
      post_id: params[:post_id],
      user_id: current_user.id
    }
    if @comment.save
      redirect_to @comment.post, notice: "コメントを登録しました!"
    else
      render :new
    end

    def show
    end

    def edit
    end

    def update
      if @comment.update(comment_params)
        redirect_to @comment.post, notice: "コメントを更新しました!"
      else
        render :edit
      end
    end

    def destroy
      @comment.destroy
      redirect_to @comment.post, notice: "コメントを削除しました!"
    end

  end

  private

    def comment_params
      params.require(:comment).permit(:title, :body, :evaluation)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
end
