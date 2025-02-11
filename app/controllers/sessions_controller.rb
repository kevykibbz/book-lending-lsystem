class SessionsController < ApplicationController
  # before_action :redirect_if_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password"
      @user = User.new(email: params[:email])
      render :new, status: :unprocessable_entity  
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Logged out successfully!"
  end

  # def redirect_if_logged_in
  #   redirect_to root_path, alert: "You are already logged in." if current_user
  # end
end
