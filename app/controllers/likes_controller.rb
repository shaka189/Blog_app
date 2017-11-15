class LikesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @like = @micropost.likes.build
    @like.user = current_user
      if @like.save
        redirect_to micropost_path(id: @micropost.id)
      end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to micropost_path(@like.micropost)
  end
end
