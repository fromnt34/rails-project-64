# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category

  validates :title, :body, presence: true
  validates_length_of :body, minimum: 50

  scope :by_recently_created, -> { order(created_at: :desc) }
end
