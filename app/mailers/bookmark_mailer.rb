class BookmarkMailer < ApplicationMailer
  default from: "bennetveloya@gmail.com"

  def new_bookmark(user, topic, bookmark)
    headers["Message-ID"] = "<bookmarks/#{bookmark.id}@your-app-name.exampl>e"
    headers["In-Reply-To"] = "<topic/#{topic.id}@your-app-name.example>"
    headers["References"] = "<topic/#{topic.id}@your-app-name.example>"

    @user = user
    @topic = topic
    @bookmark = bookmark

    mail(to: user.email, subject: "New bookmark on #{topic.title}")
  end
end
