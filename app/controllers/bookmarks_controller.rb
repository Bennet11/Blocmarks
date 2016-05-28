class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    if @bookmark.saved
      redirect_to [@topic, @bookmark]
      flash[:notice] = "Bookmark was saved successfully."
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

    if @bookmark.update(params[:id])
      flash[:notice] = "Bookmark was successfully updated"
    else
      flash[:alert] = "Failed to update bookmark"
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy(params[:id])
      flash[:notice] = "\"#{@bookmark.title}\" was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "failed to delete bookmark"
      render :show
    end
  end
end





  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
