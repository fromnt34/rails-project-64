# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def require_login
    return if current_user.present?

    flash[:alert] = t('auth.require')
    redirect_to new_user_session_path
  end
end
