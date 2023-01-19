# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  setup do
    login_as users(:current_user)

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

    post = Post.find_by @attrs

    assert { post }
    assert_redirected_to root_url
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
