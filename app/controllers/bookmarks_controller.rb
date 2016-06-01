class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.topic = @topic
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Bookmark was saved successfully."
      redirect_to [@topic, @bookmark]
    else
      flash.now[:alert] = "failed to save bookmark"
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.update(bookmark_params)
      flash[:notice] = "Bookmark was successfully updated"
      redirect_to topic_bookmark_path
    else
      flash[:alert] = "Failed to update bookmark"
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    
    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to topics_bookmarks_path
    else
      flash.now[:alert] = "failed to delete bookmark"
      render :show
    end
  end
  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
