# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :set_user

  def show
    @post = Post.includes(:user).where(user_id: @user)
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
    redirect_to profile_path(@user), notice: 'Accepted'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
