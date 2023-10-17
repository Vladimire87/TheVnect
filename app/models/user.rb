# frozen_string_literal: true

class User < ApplicationRecord
  after_create :send_mail

  followability

  has_one_attached :avatar, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :omniauthable, omniauth_providers: %i[facebook]

  validates :first_name, :last_name, :email, presence: true
  validates :tos_agreement, acceptance: { allow_nil: false, on: :create }

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def send_mail
    UserMailer.send_new_user_message(self).deliver_now
  end

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

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
end
