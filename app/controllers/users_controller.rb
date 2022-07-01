class UsersController < ApplicationController
  before_action :admin_user, only: [:index, :update, :destroy]

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def update
    @user = User.find(params[:id])
    @admin_users = User.where(is_admin: true)
    if @admin_users.count == 1 && current_user == @user
      flash[:alert] = "管理者がいなくなっちゃうよ！"
      redirect_to admin_path
    else
      if @user.update(user_params)
        flash[:notice] = "変更できたよ！"
        redirect_to admin_path
      else
        flash[:alert] = "変更に失敗したよ！"
        redirect_to admin_path
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @admin_users = User.where(is_admin: true)
    if @admin_users.count == 1 && current_user == @user
      flash[:alert] = "管理者がいなくなちゃうよ！"
      redirect_to admin_path
    else
      @user.destroy
      flash[:notice] = "ユーザーの削除に成功しました。"
      redirect_to admin_path
    end
  end

  private

  def admin_user
    redirect_to(root_path) unless current_user.is_admin?
  end

  def user_params
    params.permit(:is_admin)
  end
end
