class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Bienvenido de nuevo #{user.email} !"
      redirect_to user
    else
      flash.now[:danger] = "Upss ! tú email/password es invalido."
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:info] = "Te extrañaremos!!."
    redirect_to root_url
  end
end
