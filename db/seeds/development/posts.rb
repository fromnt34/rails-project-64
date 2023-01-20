# frozen_string_literal: true

module Seeder
  module Development
    module Posts
      def self.seed(**attrs)
        Post.create!(
          title: Faker::Lorem.sentence(random_words_to_add: 10).chop,
          body: Faker::Lorem.paragraph(random_sentences_to_add: 20),
          category: Category.all.sample,
          **attrs
        )
      end
    end
  end
end
