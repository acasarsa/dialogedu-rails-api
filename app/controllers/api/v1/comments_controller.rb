module Api 
  module V1 
    class CommentsController < ApplicationController
      before_action :find_comment, only: [:show, :update, :destroy]
    
      def index
        if params[:article_id]
          comments_of_article = Article.find_by_id(params[:article_id]).comments
          render json: comments_of_article
        else 
          comments = Comment.all
          render json: comments
        end
      end
    
      def show 
        render json: @comment
      end
    
      def create 
        comment = Comment.create(comment_params)
        if comment.valid? 
          render json: comment
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end
    
      def update 
        @comment.update(comment_params)
        if @comment.valid? 
          render json: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @comment.destroy
      end
    
      private 
    
      def find_comment
        @comment = Comment.find(params[:id])
      end
    
      def comment_params
        params.require(:comment).permit(:body, :article_id)
      end
    
    end
  end
end
