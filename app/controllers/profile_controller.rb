# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :set_user

  def show; end

  private

  def set_user
    @profile = User.find(params[:id])
  end
end
