class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    if @topic.save
      redirect_to root_path, notice: 'Topic saved'
    else
      flash[:alert] = 'Topic not saved'
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      flash[:notice] = "Topic was updated succcessfully"
      redirect_to @topic
    else
      flash[:alert] = "Failed to update topic"
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to topics_path
    else
      flash.now[:alert] = "Failed to delete post."
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
