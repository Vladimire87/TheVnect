# frozen_string_literal: true

class ProfileController < ApplicationController
  def show
    @profile = User.find(params[:id])
  end
end
