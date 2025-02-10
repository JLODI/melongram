module Commentable
    extend ActiveSupport::Concern

    def create
        @comment = @commentable.comments.new(comment_params)

        respond to do |format|
        if @comment.save
            redirect_to @commentable
        else
            format.turbo_stream { }
            format.html { redirect_to @commentable }

        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :parent_id)

end