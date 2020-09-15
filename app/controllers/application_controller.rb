class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    return User.find(session[:user_id]) if session[:user_id]

    false
  end
end
