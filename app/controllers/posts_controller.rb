class PostsController < ApplicationController


  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
  end

  def new
    @post  = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  protected

  def post_params
    params.require(:post).permit(:title, :text, :tag_list)
  end


end
