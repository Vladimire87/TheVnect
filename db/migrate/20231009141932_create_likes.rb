# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :post, null: false, foreign_key: true
      t.index %i[user_id post_id], unique: true

      t.timestamps
    end

    change_table :posts do |t|
      t.integer :likes_count, null: false, default: 0
    end
  end
end
