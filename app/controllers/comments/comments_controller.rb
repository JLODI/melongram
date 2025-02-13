class Comments::CommentsController < ApplicationController
    include Commentable

    before_action :authenticate_user!
    before_action :set_commentable
    before_action :set_current_user

    def show
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to @comment
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @current_user = current_user
        @comment.destroy
        respond_to do |format|
            format.turbo_stream {}
            format.html { redirect_to @comment.commentable}
        end
    end

    private
    
    def set_current_user
        @current_user = current_user
    end

    def set_commentable
        @parent = Comment.find(params[:comment_id])
        @commentable = @parent.commentable
    end

end