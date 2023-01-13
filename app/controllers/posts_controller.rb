# frozen_string_literal: true

class PostsController < ApplicationController
  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.creator = current_user

    if @post.save
      redirect_to root_path, notice: 'Статья успешно добавлена'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :body, :category_id)
  end
end
