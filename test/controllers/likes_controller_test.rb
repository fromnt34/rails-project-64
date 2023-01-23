# frozen_string_literal: true

require 'test_helper'

module LikesControllerTest
  class Actions < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @post = posts :one
      @user = users :current_user

      sign_in @user
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

  class RedirectIfAccessDenied < ActionDispatch::IntegrationTest
    test 'create should redirect to sign in' do
      test_redirect_to_sign_in { post post_likes_path(posts(:one)) }
    end
  end
end
