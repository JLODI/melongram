class LikesController < ApplicationController
    def create
        @like = current_user.likes.new(like_params)
        @post = @like.post
        if @like.save
            redirect_back(fallback_location: root_path)
        else
            flash[:alert] = "Something went wrong."
        end
    end

    def destroy
        @like = Like.find(params[:id])
        @post = @like.post
        if @like.destroy
            redirect_back(fallback_location: root_path)
        else
            flash[:alert] = "Something went wrong."
        end
    end

    private

    def like_params
        params.require(:like).permit(:likeable_id, :likeable_type)
    end
end
