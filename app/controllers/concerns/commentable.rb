module Commentable
    extend ActiveSupport::Concern
    include ActionView::RecordIdentifier # This will allow you to use dom_id in the controller
    include RecordHelper

    def create
        @comment = @commentable.comments.new(comment_params)

        respond to do |format|
        if @comment.save
            redirect_to @commentable
        else
            format.turbo_stream { render: turbo_stream: turbo_stream.replace(dom_id_for_records(@commentable, @comment), partial: "comments/form", locals: { comment: @comment, commentable: @commentable } ) }
            format.html { redirect_to @commentable }

        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :parent_id)

end