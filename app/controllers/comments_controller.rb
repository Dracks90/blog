class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(comment_params['post_id']) }
      else
        format.html { render :back }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    redirect_to :back
  end

  private

  def comment_params
    attributes = params.require(:comment).permit(:body, :post_id)
    attributes.merge(user_id: current_user.id)
  end
end
