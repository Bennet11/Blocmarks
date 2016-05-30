class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  has_many :urls, dependent: :destroy
end
