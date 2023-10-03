# frozen_string_literal: true

class User < ApplicationRecord
  include Gravtastic
  gravtastic

  followability

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
  validates :first_name, :last_name, :email, presence: true
  validates :tos_agreement, acceptance: { allow_nil: false, on: :create }

  has_one_attached :avatar, dependent: :destroy

  def full_name_upcase
    "#{first_name} #{last_name}".upcase
  end

  def full_name_downcase
    "#{first_name} #{last_name}".downcase
  end

  def full_name_titleize
    "#{first_name} #{last_name}".titleize
  end

  def name_initials
    "#{first_name.first}#{last_name.first}".upcase
  end

  scope :desc, -> { order(id: :desc) }
end
