# frozen_string_literal: true

module PageHelper
  def active?(path)
    request.path == path
  end
end
