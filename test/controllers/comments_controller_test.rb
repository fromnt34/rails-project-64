# frozen_string_literal: true

require 'test_helper'

module CommentsControllerTest
  class Actions < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in users :current_user

      @post = posts :one

      @attrs = {
        content: Faker::Lorem.paragraph(random_sentences_to_add: 10)
      }

      @parent_comment = post_comments :with_nested
      @nested_attrs = @attrs.merge({ parent_id: @parent_comment.id.to_s })
    end

    test 'should create comment' do
      post post_comments_url(@post), params: { post_comment: @attrs }

      comment = PostComment.find_by @attrs

      assert { comment }
      assert { @post.comments.include? comment }
      assert_redirected_to @post
    end

    test 'should not create comment' do
      wrong_attrs = {
        content: nil
      }

      post post_comments_url(@post), params: { post_comment: wrong_attrs }

      comment = PostComment.find_by wrong_attrs

      assert { comment.nil? }
      assert_response :unprocessable_entity
    end

    test 'should create nested comment' do
      post post_comments_url(@post), params: { post_comment: @nested_attrs }

      comment = PostComment.find { |i| i.ancestry == @nested_attrs[:parent_id] }

      assert { comment }
      assert { @post.comments.include? comment }
      assert_redirected_to @post
    end
  end

  class RedirectIfAccessDenied < ActionDispatch::IntegrationTest
    test 'create should redirect to sign in' do
      test_redirect_to_sign_in { post post_comments_url(posts(:one)) }
    end
  end
end
