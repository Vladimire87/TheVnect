# frozen_string_literal: true

class User < ApplicationRecord
  include Gravtastic
  gravtastic

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
  validates :first_name, :last_name, :email, presence: true
  validates :tos_agreement, acceptance: { allow_nil: false, on: :create }
end
