class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment
    before_action :set_current_user

    def update
        @current_user = current_user
        if @comment.update(comment_params)
            redirect_to @comment
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @comment.destroy
        @current_user = current_user
        respond_to do |format|
            format.turbo_stream {}
            format.html { redirect_to @comment.commentable}
        end
    end

    private

    def set_current_user
        @current_user = current_user
    end
    
    def set_comment
        @comment = current_user.comments.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:text)
    end
end