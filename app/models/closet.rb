class Closet < ActiveRecord::Base
  belongs_to :user
  # has_many :stores
end
