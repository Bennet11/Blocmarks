class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :topics, dependent: destroy
end
