# frozen_string_literal: true

module Seeder
  module Production
    def self.run
      Categorie.create name: 'Ruby'
      Categorie.create name: 'JS'
      Categorie.create name: 'C++'
    end
  end
end
