class PasswordResetsController < ApplicationController

  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email])
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      render json: {status: 'SUCCESS', message: 'Email sent with password reset instructions'}
    else
      render json: {status: 422, message: 'Email address not found.'}
    end
  end

  def edit
  end

  def update

    if params[:user][:password].empty?
      render json: {status: 422, message: 'Password cannot be empty'}
    elsif @user.update_attributes(user_params)
      log_in @user
      render json: {status: 'SUCCESS', message: 'Password has been reset.'}
    end

  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      unless (@user && @user.authenticated?(:reset, params[:id]))
        render json: {status: 422, error: 'User not authenticated'}

      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        render json: {error: 'Password reset has expired.', status: 401}
      end
    end

end
