class LikesController < ApplicationController
    include ActionView::RecordIdentifier # This will allow you to use dom_id in the controller

    def create
        likeable_type = params[:like][:likeable_type].constantize
        @likeable = likeable_type.find(params[:like][:likeable_id])
        @like = current_user.likes.new(like_params)
        if @like.save!
            respond_to do |format|
                format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@likeable), partial: 'posts/like_button', locals: { likeable: @likeable }) }
                format.html { redirect_to @likeable }
            end
        else
            flash[:alert] = "Something went wrong."
        end
    end

    def destroy
        @like = Like.find(params[:id])
        likeable_type = @like.likeable_type.constantize
        @likeable = likeable_type.find(@like.likeable_id)
        if @like.destroy
            respond_to do |format|
                format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@likeable), partial: 'posts/like_button', locals: { likeable: @likeable }) }
                format.html { redirect_to @likeable }
            end
        else
            flash[:alert] = "Something went wrong."
        end
    end

    private
    
    def like_params
        params.require(:like).permit(:likeable_id, :likeable_type)
    end
end
