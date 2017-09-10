class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login user
      remember user
      redirect_to user
    else
      errors = [ "Incorrect email or password." ]
      render 'new'
    end
  end

  def destroy
  end


end
