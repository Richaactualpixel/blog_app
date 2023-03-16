class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]

  #get post of users
  def index
    posts = current_user.posts
    render json: posts
  end

  #create post of users
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  #get post of user by post id
  def show
    post = current_user.posts.find(params[:id])
    render json: post
  end

  #update a post by post id
  def update
    post = current_user.posts.find(params[:id])
    if post.update(post_params)
      render json: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  #delete the post by post id
  def destroy
    post = current_user.posts.find(params[:id])
    
    post.destroy
    render json: "Deleted successfully"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
