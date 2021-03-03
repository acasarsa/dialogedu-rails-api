module Api 
  module V1 
    class ArticlesController < ApplicationController
      before_action :find_article, only: [:show, :update, :destroy]

      def index 
        if params[:search]
          articles = Article.where("title LIKE ?", "%" + params[:search] + "%").or(Article.where("body LIKE ?", "%" + params[:search] + "%"))
          render json: articles.empty? ? error_method : articles
        else 
          articles = Article.all
          render json: articles
        end
      end

      def show 
        render json: @article 
      end

      def create 
        article = Article.create(article_params)
        if article.valid? 
          render json: article
        else 
          render json: article.errors, status: :unprocessable_entity
        end
      end

      def update 
        @article.update(article_params)
        if @article.valid? 
          render json: @article
        else 
          render json: @article.errors, status: :unprocessable_entity
        end 
      end
      
      def destroy
        @article.destroy
      end

      private 

      def find_article
        @article = Article.find(params[:id])
      end

      def article_params 
        params.require(:article).permit(:title, :body, :search)
      end
      def error_method
        {
          "error": "no results found"
        }
      end

    end
  end
end
