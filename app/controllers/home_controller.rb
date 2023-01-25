# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.includes(:creator).by_recently_created
  end
end
