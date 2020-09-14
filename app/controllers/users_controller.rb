class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'User was successfully created and logged in.'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @created_past_events = @user.created_events.past_events
    @created_upcoming_events = @user.created_events.upcoming_events
    @past_events = @user.attended_events.past_events
    @upcoming_events = @user.attended_events.upcoming_events
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
