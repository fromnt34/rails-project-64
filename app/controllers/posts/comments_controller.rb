# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :require_login, only: :create

    def create
      @comment = PostComment.new comment_params
      @comment.post = resource_post
      @comment.user = current_user

      if @comment.save
        redirect_to resource_post, notice: t('.')
      else
        model_name = 'Комментарий'
        flash[:alert] = "#{model_name} #{@comment.errors.messages[:content].first}"

        redirect_to resource_post, status: :unprocessable_entity
      end
    end

    private

    def comment_params
      params.required(:post_comment).permit(:content, :parent_id)
    end
  end
end
