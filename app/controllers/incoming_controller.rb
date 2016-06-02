class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

     # Find the user by using params[:sender]
     @user = User.find_by(email: params[:sender])
     # Find the topic by using params[:subject]
     topic = Topic.find_or_create_by(name: params[:subject])
     # Assign the url to a variable after retreiving it from params["body-plain"]
     @bookmark.url = params["body-plain"]
     # Check if user is nil, if so, create and save a new user
     if user.nil?
       redirect_to new_user_path
     end
     # Check if the topic is nil, if so, create and save a new topic
     if topic.nil?
       redirect_to new_topic_path
     end
     # Now that you're sure you have a valid user and topic, build and save a new bookmark
     @bookmark = Bookmark.new
     @bookmark.topic_id = @topic.id
     @bookmark.url = @url
     @bookmark.save!

     head 200
  end
end
