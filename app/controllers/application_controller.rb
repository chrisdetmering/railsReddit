class ApplicationController < ActionController::Base
  helper_method :current_user

  def login!(user)
    @current_user = user 
    session[:session_token] = user.session_token
  end

  def current_user
    return nil if session[:session_token] == nil 
    @current_user ||= User.find_by(session_token: session[:session_token])
  end 

  def logout!
    current_user.try(:reset_session_token)
    session[:session_token] = nil 
  end 

  def require_current_user! 
    if current_user.nil?
      redirect_to new_session_url
    elsif !params[:id].nil? && current_user.id.to_s != params[:id]
      redirect_to user_url(current_user)
    end
  end 

  def only_author_can_edit 
    sub = Sub.find_by(id: params[:id])

    if current_user.id != sub.moderator_id
       redirect_to subs_url
    end
  end 

end
