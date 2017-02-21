class LikesController < ApplicationController
    before_action :set_like, only: [:destroy]
    def create
        Like.create(secret_id: params[:secret_id], user_id: current_user.id)
        redirect_to secrets_url
    end
    
    def destroy
        # like = Like.where(user_id: current_user.id, secret_id: params[:id]).first
        # if like
        #     like.destroy
        # end
        @like.destroy
        redirect_to secrets_url
    end
    
    private
    def set_like
        @like = Like.find(params[:id])
    end
end 