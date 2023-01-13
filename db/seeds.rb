# frozen_string_literal: true

5.times do |i|
  Category.create!(name: "Category #{i + 1}")
end

10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 123_456
  )

  Post.create!(
    title: Faker::Lorem.sentence(random_words_to_add: 10).chop,
    body: Faker::Lorem.paragraph(random_sentences_to_add: 20),
    category: Category.all.sample,
    creator: user
  )
end
