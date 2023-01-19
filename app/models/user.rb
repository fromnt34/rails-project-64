# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_many :likes, class_name: 'PostLike'
  has_many :comments, class_name: 'PostComment'

  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable
end
