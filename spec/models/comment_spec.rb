require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with valid attributes" do
    article = Article.create(title: "dogs are the best", body: "an article describing why dogs are amazing")
    
    comment = Comment.new(body: "great work!", article_id: article.id)
    comment.validate
    expect(comment).to be_valid
  end

  context "without a body" do
    it "should not be valid" do
      article = Article.create(title: "dogs are the best", body: "an article describing why dogs are amazing")
      comment = Comment.new(article_id: article.id)
      comment.validate
      expect(comment.valid?).to be false
    end
  end

end
