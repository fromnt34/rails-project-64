# frozen_string_literal: true

module Seeder
  module Development
    module PostComments
      DEFAULT_FAKER_OPTIONS = {
        random_sentences_to_add: 10
      }.freeze

      def self.seed(**attrs)
        faker_options = DEFAULT_FAKER_OPTIONS.merge attrs[:faker_options]

        PostComment.create!(
          content: Faker::Lorem.paragraph(random_sentences_to_add: faker_options[:random_sentences_to_add]),
          **attrs.except(:faker_options)
        )
      end
    end
  end
end
