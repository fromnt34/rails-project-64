# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :likes, class_name: 'PostLike'
  has_many :comments, class_name: 'PostComment'

  validates :title, :body, presence: true
  validates_length_of :body, minimum: 50

  scope :by_recently_created, -> { order(created_at: :desc) }

  def find_like(user)
    likes.find { |like| like.user_id == user.id }
  end

  def liked_by?(user)
    likes.where(user:).exists?
  end
end
