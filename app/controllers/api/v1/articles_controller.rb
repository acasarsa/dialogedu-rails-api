module Api 
  module V1 
    class ArticlesController < ApplicationController
      before_action :find_article, only: [:show, :update, :destroy]

      def index 
        articles = Article.all
        if params[:search]
          # filtered_articles = Article.search(params[:search])
          filtered_articles = Article.where(articles.include? params[:search] )
          render json: filtered_articles
        else 
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
    end
  end
end
