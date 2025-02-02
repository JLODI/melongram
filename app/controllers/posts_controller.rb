class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  
  def index
      @posts = Post.all.limit(10)
  end

  def new
      @post = Post.new
  end

  def create
      @post = current_user.posts.build(post_params)
      if @post.save
          flash[:notice] = "Your post has been created."
          redirect_to posts_path
      else
      
          flash[:alert] = @post.errors.full_messages[0]
          redirect_to new_post_path
      end
  end

  def show
      @photos = post.images
  end

  def edit

  end

  def destroy
      @post.destroy
      redirect_to posts_path
      flash.now[:notice] = "Your post has been deleted"

  end

  private

  def set_post
      @post = Post.find_by id: params[:id]
      return if @post
      flash.now[:alert] = "Post does not exist."
      redirect_to root_path
  end

  def post_params
      params.require(:post).permit(:description, images: [])
  end
end