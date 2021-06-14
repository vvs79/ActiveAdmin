class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def show
    @blog = Blog.find_by(id: params[:id])
    @comment = AllComment.new
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :user_id)
  end
end
