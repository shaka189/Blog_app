class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  def create
    @micropost = Micropost.find params[:micropost_id]
    @comment = Comment.new(comment_params)
    @comment.micropost = @micropost
    @comment.user = current_user
    if @comment.save
    flash[:success] = "Comment successfully added"
    # redirect_to @comment.micropost
    redirect_to micropost_path(id: @micropost.id)
    else
      render 'microposts/show'
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
