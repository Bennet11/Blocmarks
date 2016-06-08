module BookmarksHelper
  def user_is_authorized_to_edit_bookmarks?
    policy(@bookmark).edit?
  end

  def user_is_authorized_to_destroy_bookmarks?
    policy(@bookmark).destroy?
  end
end
