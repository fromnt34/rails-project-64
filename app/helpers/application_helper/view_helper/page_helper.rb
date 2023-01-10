# frozen_string_literal: true

module ApplicationHelper
  module ViewHelper
    module PageHelper
      def active?(path)
        request.path == path
      end
    end
  end
end
