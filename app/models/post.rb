# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user

  validates :body, presence: true, length: { minimum: 3, maximum: 1000 }
end
