# frozen_string_literal: true

module Seeder
  module Categories
    def self.seed(i)
      Category.create!(name: "Category #{i + 1}")
    end
  end
end
