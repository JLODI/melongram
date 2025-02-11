class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment

    def show
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to @comment
        else
        end
    end

    def destroy
    end

    private
    
    def set_comment
        @comment = current_user.comments.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:text)
    end
end