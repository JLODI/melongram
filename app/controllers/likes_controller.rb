class LikesController < ApplicationController

    before_action :set_likeable

    def create
        likeable_type = params[:like][:likeable_type].constantize
        @likeable = likeable_type.find(params[:like][:likeable_id])
        @like = current_user.likes.new(like_params)
        if @like.save!
            redirect_back(fallback_location: root_path)
        else
            flash[:alert] = "Something went wrong."
        end
    end

    def destroy
        @like = Like.find(params[:id])
        if @like.destroy
            redirect_back(fallback_location: root_path)
        else
            flash[:alert] = "Something went wrong."
        end
    end

    private
    def set_likeable
        if params[:post_id]
            @likeable = Post.find(params{:post_id})
        # elseif <--- add other likeable types here
        end
    end 

    def like_params
        params.require(:like).permit(:likeable_id, :likeable_type)
    end
end
