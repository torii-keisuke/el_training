# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:user, :name, :email, :password, :password_confirmation)
  end
end
