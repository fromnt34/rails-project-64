# frozen_string_literal: true

module Seeder
  module Users
    def self.seed
      User.create!(
        email: Faker::Internet.email,
        password: 123_456
      )
    end
  end
end
