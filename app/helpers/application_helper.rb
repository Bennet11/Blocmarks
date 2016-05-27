module ApplicationHelper
  def user_avatar(email)
    image_tag("https://robohash.org/#{email}.png?size=128x128")
  end
end
