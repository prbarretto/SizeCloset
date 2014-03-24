class Store < ActiveRecord::Base
  belongs_to :closet
  has_many :categories
end
