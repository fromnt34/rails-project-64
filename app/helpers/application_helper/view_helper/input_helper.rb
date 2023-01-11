# frozen_string_literal: true

module ApplicationHelper
  module ViewHelper
    module InputHelper
      def error_message(resource, input)
        resource.errors.full_messages_for(input).first
      end

      def errors?(resource, input)
        !resource.errors.messages_for(input).empty?
      end

      def status_class(resource, input)
        errors?(resource, input) ? 'is-invalid' : 'is-valid'
      end
    end
  end
end
