class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "Bienvenido de nuevo #{user.email} !"
      redirect_back_or user
    else
      flash.now[:danger] = "Upss ! tú email/password es invalido."
      render 'new'
    end
  end

  def destroy
    sign_out if signed_in?
    flash[:info] = "Te extrañaremos!!."
    redirect_to root_url
  end
end
