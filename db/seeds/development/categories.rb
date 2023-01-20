# frozen_string_literal: true

module Seeder
  module Development
    module Categories
      def self.seed(iter)
        Category.create!(name: "Category #{iter + 1}")
      end
    end
  end
end
