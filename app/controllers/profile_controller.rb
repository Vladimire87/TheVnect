# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :set_user

  def show
    @posts = Post.includes(:user).where(user_id: @user)
    @comments = Comment.includes(:user).where(user_id: @user)
  end

  def follow
    current_user.send_follow_request_to(@user)
    redirect_to profile_path(@user), alert: 'Sent'
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to profile_path(@user)
  end

  def unrequest
    current_user.remove_follow_request_for(@user)
    redirect_to profile_path(@user)
  end

  def accept
    current_user.accept_follow_request_of(@user)
    accept_following
    redirect_to profile_path(@user), notice: 'Accepted'
  end

  private

  def accept_following
    current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(current_user)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
