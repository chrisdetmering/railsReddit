class SubsController < ApplicationController 
  before_action :only_author_can_edit, only: :edit
  
  def index
    @subs = Sub.all 
  end 

  def create 
    @sub = Sub.new(subs_params)
    @sub.moderator_id = current_user.id
    if @sub.save 
      redirect_to subs_url
    else 
      render :new
    end 
  end 

  def new 
    @sub = Sub.new
  end 

  def show 
    @sub = Sub.find_by(id: params[:id])
  end 

  def edit 
    @sub = Sub.find_by(id: params[:id])
  end 

  def update 
    @sub = Sub.find_by(id: params[:id])
    
    if @sub.update(subs_params)
      redirect_to @sub
    else
      render :edit
    end
  end 

  private
  def subs_params 
    params.require(:subs).permit(:title, :description)
  end 
end 