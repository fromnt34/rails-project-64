# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :require_login, only: :create

    def create
      return if already_liked?

      @like = PostLike.create(
        post: resource_post,
        user: current_user
      )

      redirect_to resource_post
    end

    def destroy
      return unless already_liked?

      @like = resource_post.find_like current_user
      @like.destroy

      redirect_to resource_post
    end

    private

    def already_liked?
      !resource_post.find_like(current_user).nil?
    end
  end
end
