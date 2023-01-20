# frozen_string_literal: true

module Seeder
  module Development
    autoload :Categories, './db/seeds/development/categories'
    autoload :Users, './db/seeds/development/users'
    autoload :Posts, './db/seeds/development/posts'
    autoload :PostComments, './db/seeds/development/post_comments'

    def self.run
      # category
      5.times do |i|
        Categories.seed i
      end

      # post
      10.times do |i|
        user = Users.seed
        post = Posts.seed creator: user

        # comments
        next unless (i + 1).even?

        PostComments.seed(
          post:,
          user:,
          faker_options: { random_sentences_to_add: 10 }
        )

        # another comment
        next unless ((i + 1) % 4).zero?

        comment = PostComments.seed(
          post:,
          user:,
          faker_options: { random_sentences_to_add: 5 }
        )

        # nested comment
        comment.children.create!(
          content: Faker::Lorem.paragraph(random_sentences_to_add: 2),
          post:,
          user:
        )
      end
    end
  end
end
