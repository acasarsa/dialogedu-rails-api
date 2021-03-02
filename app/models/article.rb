class Article < ApplicationRecord
  has_many :comments

  validates_presence_of :title, :body
  validates :title, length: {minimum: 10}

  def search(query)
    results = self.where(articles.include? query )
  end
end
