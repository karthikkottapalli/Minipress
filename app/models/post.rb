class Post < ActiveRecord::Base
  has_many :comments
  validates :headline, presence: true
end