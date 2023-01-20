# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :restrict_with_exception, inverse_of: :creator
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  has_many :comments, class_name: 'PostComment', dependent: :destroy

  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :validatable
end
