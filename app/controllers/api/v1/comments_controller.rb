class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :update, :destroy]

  def index

  end

  def show 

  end

  def create 

  end

  def update 
    @comment.update()
  end

  def destroy

  end

  private 

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end

end
