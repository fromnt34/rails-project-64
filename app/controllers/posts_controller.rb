# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def show
    @post = Post.find params[:id]

    @user_like = @post.find_like(current_user) if current_user

    @comments = @post.comments.includes(:user).arrange
    @new_comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build post_params

    if @post.save
      redirect_to root_path, notice: t('.')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :body, :category_id)
  end
end
