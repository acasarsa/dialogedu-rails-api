module Api 
  module V1 
    class ArticlesController < ApplicationController

      def index 
        articles = Article.all
        render json: articles
      end

      def show 
        article = Article.find(params[:id])
        render json: article 
      end

      def create 
        article = Article.create(article_params)
        render json: article
      end

      def update 
        article.update(article_params)
        render json: article 
      end
      
      def destroy
        article.destroy
      end

      private 

      def find_article
        article = Article.find(params[:id])
      end

      def article_params 
        params.require(:article).permit(:title, :body, :search)
      end
    end
  end
end
