class ProfilesController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller? 

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to profile_path
    else
      flash[:notice] = "プロフィール情報の変更に失敗しました"
      render :edit
    end
  end

  def show
    @user = User.find(current_user.id)
  end
 
  private
  

  def user_params
    params.require(:user).permit(:image, :name, :self_introduction)
  end

  def configure_permitted_parameters
    device_parameter_sanitizer.permit(:account_update, keys: [:image, :name, :self_introduction])
  end
end
