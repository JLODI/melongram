module Commentable
    extend ActiveSupport::Concern
    include ActionView::RecordIdentifier # This will allow you to use dom_id in the controller
    include RecordHelper # Lets you use dom id record helper

    def create
        @comment = @commentable.comments.new(comment_params)
        @comment.user = current_user

        respond_to do |format|
            if @comment.save
                comment = Comment.new
                format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id_for_records(@commentable, comment), partial: "comments/form", locals: { comment: comment, commentable: @commentable } ) }
                format.html { redirect_to @commentable }
            else
                format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id_for_records(@commentable, @comment), partial: "comments/form", locals: { comment: @comment, commentable: @commentable } ) }
                format.html { redirect_to @commentable }
            end
        end
    end

    def edit
    end

    private

    def comment_params
        params.require(:comment).permit(:text, :parent_id)
    end

end