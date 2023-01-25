# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, alert: t('devise.failure.unauthenticated')
    end
  end
end
