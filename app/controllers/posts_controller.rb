class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
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
          redirect_to root_path
      else
          flash[:alert] = @post.errors.full_messages[0]
          redirect_to root_path
      end
  end

  def show
    @likes = @post.likes.includes(:user)
    @is_liked = @post.is_liked(current_user)
  end

  def edit
  end

  def update
    if @post.update(edit_post_params)
        flash[:notice] = "Your post has been updated!"
        redirect_to root_path
    else
        flash[:error] = @post.errors.full_messages.join ('<br/>')
        redirect_to root_path
        render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @post.destroy    
        if @post.destroy
            flash[:notice] = "Your post has been deleted."
            redirect_to root_path
        else
            flash.now[:error] = @post.errors.full_messages.join ('<br/>')
            render :destroy, status: :unprocessable_entity
        end
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