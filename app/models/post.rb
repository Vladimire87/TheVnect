# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { minimum: 3, maximum: 600 }
end
