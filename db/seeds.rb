# frozen_string_literal: true

require_relative 'seeds/seeder'

# category
5.times do |i|
  Seeder::Categories.seed i
end

# post
10.times do |i|
  user = Seeder::Users.seed
  post = Seeder::Posts.seed creator: user

  # comments
  next unless (i + 1).even?

  Seeder::PostComments.seed(
    post:,
    user:,
    faker_options: { random_sentences_to_add: 10 }
  )

  # another comment
  next unless ((i + 1) % 4).zero?

  comment = Seeder::PostComments.seed(
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
