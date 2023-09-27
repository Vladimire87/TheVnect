class ProfileController < ApplicationController
  def index
    @profile = current_user
  end
end
