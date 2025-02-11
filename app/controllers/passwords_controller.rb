require 'pp' 

class PasswordsController < ApplicationController
  def new
    # Render new password reset form
  end

  def create
    email=params[:email]
    user = User.find_by(email:email)
    if user
      user.update(reset_password_token: SecureRandom.hex(10), reset_password_sent_at: Time.now.utc)
      UserMailer.password_reset(user).deliver_now
      redirect_to new_session_path, notice: "Password reset link sent to #{email}."
    else
      flash.now[:alert] = "Email not found"
      @user = User.new(email: params[:email])
      render :new, status: :unprocessable_entity  
    end
  end

  def edit
    @user = User.find_by(reset_password_token: params[:token])
    unless @user && @user.reset_password_period_valid?
      redirect_to new_password_path, alert: "Password reset link has expired or is invalid."
    end
  end

  def update
    @user = User.find_by(reset_password_token: params[:token])
    if @user.update(user_params)
      @user.update(reset_password_token: nil, reset_password_sent_at: nil)
      redirect_to new_session_path, notice: "Password has been reset."
    else
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
