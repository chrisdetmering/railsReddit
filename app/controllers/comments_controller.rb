class CommentsController < ApplicationController 
  def create 
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id 

    if @comment.save 
      redirect_to post_url(@comment.post_id)
    else 
      render json: @comment.errors.full_messages
    end 

  end 

  def new 
    @comment = Comment.new
    @post_id = params[:post_id]
  end 

  def show 
    @comment = Comment.find_by(id: params[:id])
  end 

  def comment_params 
    params.require(:comments).permit(:post_id, :content, :parent_comment_id)
  end 

end 