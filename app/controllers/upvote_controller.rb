class UpvoteController < ApplicationController
  def create
  	@micropost = Micropost.find params[:micropost_id]
  	@upvote = Upvote.new(secure_params)
    @upvote.micropost = @micropost
    @upvote.user = current_user
    if @upvote.save
      respond_to do |format|
        format.html { redirect_to @upvote.post }
        format.js # we'll use this later for AJAX!
      end
    end
  end

  def destroy
  end
end
