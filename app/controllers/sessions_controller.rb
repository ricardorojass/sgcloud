class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Bienvenido a SG Cloud!'
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Te extrañaremos!'
  end
end
