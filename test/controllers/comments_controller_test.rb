# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  setup do
    login_as users(:current_user)

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

  test 'should create nested comment' do
    post post_comments_url(@post), params: { post_comment: @nested_attrs }

    comment = PostComment.find { |i| i.parent_comment == @nested_attrs[:parent_id] }

    assert { comment }
    assert { @post.comments.include? comment }
    assert_redirected_to @post
  end
end
