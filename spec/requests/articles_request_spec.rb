require 'rails_helper'

RSpec.describe "Articles", type: :request do

  article_params = { 
    title: "a story about a cat",
    body: "this cat had mittens"
  }

  other_article_params = { 
    title: "a story about a dog",
    body: "he was a good boy"
  }

  context "GET #index" do
    it "should get index succesffuly" do
      get '/api/v1/articles'
      expect(response).to have_http_status(200)
    end

    context "with search params" do 
      context "when search params return results" do 
        it "should get results that only match search params" do
          Article.create(article_params)
          Article.create(other_article_params)
          
          get '/api/v1/articles?search=dog'
  
          expect(response.body).to include("dog")
          expect(response.body).to_not include("cat")
          expect(response).to have_http_status(200)
        end
      end

      context "when search params return no results" do 
        it "should display error message: 'no results found'" do 
          Article.create(article_params)
          Article.create(other_article_params)
          
          get '/api/v1/articles?search=octopus'

          expect(response.body).to include("no results found")
          expect(response).to have_http_status(200)
        end
      end
    end
  end

  context "POST #create" do 
    it "creates article with valid attributes" do 
      post '/api/v1/articles', params: {article: article_params}
      expect(Article.count).to eq(1)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  context "PUT #update" do 
    it "updates the article" do 
      Article.create(article_params)
      id = Article.last.id
      put "/api/v1/articles/#{id}", params: {article: {title: "A story about an octopus", body: "she was a smol octopus who lived in a pepsi bottle"}}
      expect(article_params[:title]).to_not eq(Article.last.title)
      expect(response.body).to include("she was a smol octopus who lived in a pepsi bottle")
    end
  end

  context "GET #show" do 
    it "should render the desired article" do 
      Article.create(other_article_params)
      id = Article.last.id
      get "/api/v1/articles/#{id}"
      expect(response).to have_http_status(200)
    end
  end

  context "DELETE #destroy" do 
    it "should delete the desired article" do 
      Article.create(other_article_params)
      count = Article.count
      id = Article.last.id
      expect do 
        delete "/api/v1/articles/#{id}"
      end.to change(Article, :count).by(-1)
      
    end
  end

end
