# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @users = User.includes(avatar_attachment: :blob).all
  end
end
