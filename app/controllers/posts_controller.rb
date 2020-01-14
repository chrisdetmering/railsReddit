class PostsController < ApplicationController 
  
  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to @post
    else 
      render json: @post.errors
    end 
  end 

  def new 
    @post = Post.new
    @subs = Sub.all
  end 

  def edit 
    @post = Post.find_by(id: params[:id])
    @subs = Sub.all
  end 

  def show 
    @post = Post.find_by(id: params[:id])
    @author = User.find_by(id: @post.author_id)
    @subs = Sub.find(@post.sub_ids)
    @all_comments = @post.comments
  end 

  def update 
  end 

  def destroy 
  end 

  private 

  def post_params
    params.require(:post).permit(:title, :content, sub_ids: [])
  end 
end 