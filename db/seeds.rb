# frozen_string_literal: true

require_relative 'seeds/seeder'

env = ENV['RAILS_ENV'] || Rails.env

Object.const_get("Seeder::#{env.capitalize}").run
