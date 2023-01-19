# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  setup do
    @post = posts :one
    @user = users :current_user

    login_as @user
  end

  test 'should create like' do
    post post_likes_path(@post)

    assert { @post.find_like @user }

    assert_redirected_to @post
  end

  test 'should delete like' do
    post = posts :with_like

    like = post.find_like @user
    delete post_like_path(post, like)

    assert { post.likes.count.zero? }
    assert_redirected_to post
  end
end
