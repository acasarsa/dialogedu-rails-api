require 'rails_helper'

RSpec.describe Article, type: :model do
  
  it "is valid with valid attributes" do 
    article = Article.new(title: "dumby title", body: "an article about space")
    article.validate
    expect(article).to be_valid
  end

  context "with out a title" do 
    it "should not be valid" do 
      article = Article.new(body: "an article about space")
      article.validate
      expect(article.valid?).to be false
    end
  end

  context "with out a body" do 
    it "should not be valid" do 
      article = Article.new(title: "dumby title")
      article.validate
      expect(article.valid?).to be false
    end
  end

  context "title is under 10 characters" do
    it "should not be valid" do
      article = Article.new(title:  "too short", body: "an article about octopi")
      article.validate
      expect(article.valid?).to be false
    end
  end

end
