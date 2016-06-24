class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.liked_bookmarks
  end
end
