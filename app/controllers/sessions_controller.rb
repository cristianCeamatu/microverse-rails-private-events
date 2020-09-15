class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by_name(params[:name])

    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'User was successfully logged in.'
    else
      flash.now.alert = 'Login failed, user not found. Please try again or create a new user.'
      render action: :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash.alert = 'Succesfully logged out.'
    redirect_to sign_in_path
  end
end
