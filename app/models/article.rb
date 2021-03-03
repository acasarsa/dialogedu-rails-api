class Article < ApplicationRecord
  has_many :comments

  validates_presence_of :title, :body
  validates :title, length: {minimum: 10}
end
