# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post!

  def create
    @comment = @post.comments.create comment_params
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'Comment Created!'
      redirect_to post_path(@post)
    else
      render 'posts/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post!
    @post = Post.find params[:post_id]
  end
end
