# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # @users = User.includes(avatar_attachment: :blob).all
    # @users = User.where.not(id: current_user).includes(avatar_attachment: :blob)
    # @posts = Post.includes([:user]).order(created_at: :DESC).all
    @timeline = Post.where(user_id: current_user.id).includes(user: [avatar_attachment: :blob]).or(Post.where(user_id: current_user.following.ids)).order(created_at: :desc)
  end
end
