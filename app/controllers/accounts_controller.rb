class AccountsController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to account_path(current_user)
    else
      flash[:notice] = "アカウント情報の変更に失敗しました"
      render :edit
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
