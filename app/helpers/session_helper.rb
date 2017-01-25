module SessionHelper

  def session_logged_in?
    !session[:user_id].nil?
  end

  def session_current_user
    begin
      @current_user ||= User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      session.clear
      @current_user = nil
    end
  end

  def session_logout
    session.clear
  end

  def session_login user
    session[:user_id] = user.id
  end

end