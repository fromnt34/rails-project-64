# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    # rubocop:disable Metrics/AbcSize
    def create
      @comment = PostComment.new comment_params
      @comment.post = resource_post
      @comment.user = current_user

      if @comment.save
        redirect_to resource_post, notice: 'Комментарий успешно добавлен'
      else
        model_name = 'Комментарий'
        flash[:alert] = "#{model_name} #{@comment.errors.messages[:content].first}"

        redirect_to resource_post
      end
    end
    # rubocop:enable Metrics/AbcSize

    private

    def comment_params
      params.required(:post_comment).permit(:content, :parent_id)
    end
  end
end
