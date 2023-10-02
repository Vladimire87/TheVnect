# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :set_user

  def show; end

  def follow
    
    current_user.send_follow_request_to(@user)
    redirect_to profile_path(@user)
  end

  def unfollow
    current_user.unfollow(@user)
    redirect_to profile_path(@user)
  end

  def unrequest
    current_user.remove_follow_request_for(@user)
    redirect_to profile_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
