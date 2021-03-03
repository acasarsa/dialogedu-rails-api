require 'rails_helper'

RSpec.describe "Comments", type: :request do
  article_params = { 
    title: "a story about a dog",
    body: "he was a good boy"
  }
  id = Article.create(article_params).id
  comment = Comment.create(article_id: id, body: "great work!")
  comment2 = Comment.create(article_id: id, body: "nice job!")

  context "GET #index" do 
    it "should get index successfully" do
      get "/api/v1/comments"
      expect(response).to have_http_status(200)
    end

    context "with article_id params" do 
      it "should get all comments of that article" do
        get "/api/v1/comments?article_id=#{id}"
        expect(Comment.count.positive?).to be true
        expect(response).to have_http_status(200)
      end
    end
  end

  context "POST #create" do 
    it "creates comment with valid attributes" do 
      expect do 
        post "/api/v1/comments", params: {comment: {article_id: id, body: "love this one!"}}
        expect(response).to have_http_status(200)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end.to change(Comment, :count).by(1)
      
    end
  end

  context "GET #show" do 
    it "should render the desired comment" do
      get "/api/v1/comments/#{comment.id}"
      expect(response).to have_http_status(200)
    end
  end

  context "PUT #update" do 
    it "updates the comment" do 
      put "/api/v1/comments/#{comment2.id}", params:{comment: {body: "test test"}}
      expect(comment.body).to_not eq(Comment.last.body)
      expect(response.body).to include("test test")
      expect(response).to have_http_status(200)
    end
  end

  context "DELETE #destroy" do 
    it "should delete the desired comment" do 
      expect do 
        delete "/api/v1/comments/#{comment2.id}"
      end.to change(Comment, :count).by(-1)
    end
  end
end
