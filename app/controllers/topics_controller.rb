class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
  end

  def new
  end

  def edit
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




  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
