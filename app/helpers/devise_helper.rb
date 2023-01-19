# frozen_string_literal: true

module DeviseHelper
  def active?(path)
    request.path == path
  end
end
