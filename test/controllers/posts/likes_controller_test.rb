# frozen_string_literal: true

require 'test_helper'

module LikesControllerTest
  class Actions < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @current_user = users :current_user
      sign_in @current_user
    end

    test 'should create like' do
      test_post = posts :one

      post post_likes_path(test_post)

      like = PostLike.find_by({ post: test_post, user: @current_user })

      assert { like }
      assert_redirected_to test_post
    end

    test 'should delete like' do
      post = posts :with_like
      like = post_likes :one

      delete post_like_path(post, like)

      assert { post.likes.find_by(id: like.id).nil? }
      assert_redirected_to post
    end
  end

  class RedirectIfAccessDenied < ActionDispatch::IntegrationTest
    test 'create should redirect to sign in' do
      test_redirect_to_sign_in { post post_likes_path(posts(:one)) }
    end
  end
end
