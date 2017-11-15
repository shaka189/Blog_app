class DislikesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @dislike = @micropost.dislikes.build
    @dislike.user = current_user
      if @dislike.save
        redirect_to micropost_path(id: @micropost.id)
      end
  end
  
  def destroy
    @dislike = Dislike.find(params[:id])
    @dislike.destroy
    redirect_to micropost_path(@dislike.micropost)
  end
end
