# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
      PostLike.find_or_create_by(
        post: resource_post,
        user: current_user
      )

      redirect_to resource_post
    end

    def destroy
      @like = resource_post.find_like current_user

      return if @like.blank?

      @like.destroy

      redirect_to resource_post
    end
  end
end
