class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Se ha enviado un correo electrónico con las instrucciones para restablecer la contraseña."
      redirect_to root_url
    else
      flash.now[:danger] = "El correo electrónico no existe en la base de datos"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      flash.now[:danger] = "Por favor ingresa una contraseña"
      render 'edit'
    elsif @user.update_attributes(user_params)
      sign_in @user
      flash[:success] = "La contraseña ha sido cambiada con éxito"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    # Before filters

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      unless (@user && @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "El tiempo para cambiar la contraseña ha expirado"
        redirect_to new_password_reset_url
      end
    end
end
