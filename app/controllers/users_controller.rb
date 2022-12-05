class UsersController < ApplicationController
  before_action :admin_user, only: %i[index update destroy]

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def update
    @user = User.find(params[:id])
    admin_users = User.where(is_admin: true)
    if admin_users.count == 1 && current_user == @user
      flash[:alert] = if params[:is_admin] == '0'
                        '管理者がいなくなっちゃうよ！'
                      else
                        '君は管理者だよ'
                      end
    elsif @user.update(user_params)
      flash[:notice] = '変更できたよ！'
    else
      flash[:alert] = '変更に失敗したよ！'
    end
    redirect_to admin_path
  end

  def destroy
    @user = User.find(params[:id])
    admin_users = User.where(is_admin: true)
    if admin_users.count == 1 && current_user == @user
      flash[:alert] = '管理者がいなくなちゃうよ！'
    else
      @user.destroy
      flash[:notice] = 'ユーザーの削除に成功しました。'
    end
    redirect_to admin_path
  end

  private

  def admin_user
    redirect_to(root_path) unless current_user.is_admin?
  end

  def user_params
    params.permit(:is_admin)
  end
end
