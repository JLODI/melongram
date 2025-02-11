class Posts::CommentsController < ApplicationController
  include Commentable
  before_action :set_commentable
  before_action :authenticate_user!

  private

  def set_commentable
    @commentable = Post.find(params[:post_id])
  end
end
