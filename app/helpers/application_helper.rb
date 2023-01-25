# frozen_string_literal: true

module ApplicationHelper
  def active?(path)
    request.path == path
  end
end
