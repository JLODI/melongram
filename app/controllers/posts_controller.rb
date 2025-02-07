class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  
  def index
      @posts = Post.all.limit(20).order(created_at: :desc)

  end

  def new
      @post = Post.new
  end

  def create
      @post = current_user.posts.build(post_params)
      if @post.save
          flash[:notice] = "Your post has been created."
          redirect_to root_path     # post_url(@post)
      else
      
          flash[:alert] = @post.errors.full_messages[0]
          redirect_to root_path
      end
  end

  def show
  end

  def edit

  end

  def update
    if @post.update(edit_post_params)
        flash.now[:notice] = "Your post has been updated!"
        redirect_to post_path(params[:id])
    else
        flash.now[:error] = @post.errors.full_messages.join ('<br/>')
        render :edit, status: :unprocessable_entity
    end

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

  def edit_post_params
    params.require(:post).permit(:description)
  end

end