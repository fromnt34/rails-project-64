# frozen_string_literal: true

require 'test_helper'

module PostsControllerTest
  class Actions < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @current_user = users :current_user
      sign_in @current_user

      @post = posts :one

      @attrs = {
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.characters(number: 100),
        category_id: categories(:one).id
      }
    end

    test 'should get new' do
      get new_post_url
      assert_response :success
    end

    test 'should create post' do
      post posts_url, params: { post: @attrs }

      post = Post.find_by @attrs.merge({
                                         creator: @current_user
                                       })

      assert { post }
      assert_redirected_to root_url
    end

    test 'should not create post due to validation' do
      wrong_attrs = {
        title: nil,
        body: nil,
        category_id: nil
      }

      post posts_url, params: { post: wrong_attrs }

      post = Post.find_by wrong_attrs

      assert { post.nil? }
      assert_response :unprocessable_entity
    end

    test 'should show post' do
      get post_url(@post)
      assert_response :success
    end
  end

  class RedirectIfAccessDenied < ActionDispatch::IntegrationTest
    test 'new should redirect to sign in' do
      test_redirect_to_sign_in { get new_post_url }
    end

    test 'create should redirect to sign in' do
      test_redirect_to_sign_in { post posts_url }
    end
  end
end
