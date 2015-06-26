class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :new, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Bienvenido a SG Cloud!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Perfil actualizado"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def signed_in_user
    unless signed_in?
      store_location
      flash[:warning] = "Upss! primero debes ingresar."
      redirect_to signin_path unless signed_in?
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
  end
end
