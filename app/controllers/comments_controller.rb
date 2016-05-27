class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'Comment saved'
    else
      flash[:alert] = 'Comment creation failed'
    end
    redirect_to @topic
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
