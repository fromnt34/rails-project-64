# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :require_login

    def create
      @like = PostLike.create(
        post: resource_post,
        user: current_user
      )

      redirect_to resource_post
    end

    def destroy
      @like = resource_post.likes.find params[:id]
      @like.destroy

      redirect_to resource_post
    end
  end
end
