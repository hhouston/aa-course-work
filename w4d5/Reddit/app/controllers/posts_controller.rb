class PostsController < ApplicationController

  def new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = @post.sub.id
    if @post.save
      redirect_to sub_url(@post.sub)
    else
      redirect_to sub_url(@post.sub)
    end
  end

  def edit
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attribues(post_params)
      redirect_to post_url(@post)
    else
      render :edit
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub)
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :user_id)
  end
end
