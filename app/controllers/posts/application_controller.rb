# frozen_string_literal: true

module Posts
  class ApplicationController < ApplicationController
    def require_login
      return if current_user.present?

      flash[:alert] = t('.auth.require')
      redirect_to new_user_session_path
    end

    def resource_post
      @resource_post ||= Post.find params[:post_id]
    end
  end
end
