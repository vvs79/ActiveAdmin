class AllCommentsController < ApplicationController

  def index
    @comments = AllComment.all
  end

  def create
    @comment = AllComment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      # redirect_to blog_path(@comment.blog)
      # render json: @comment
    else
      render :back
    end
  end

  private

  def comment_params
    params.require(:all_comment).permit(:title, :body, :blog_id)
  end
end
