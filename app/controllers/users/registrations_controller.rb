# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  
  def new
    @user = User.new
  end

  def create
    @user =  User.new(user_params1)
    if @user.save!
      flash[:notice] = "アカウントを登録しました"
      redirect_to root_path
    else
      flash[:notice] = "アカウントの登録に失敗しました"
      render "new"
    end
  end

  # GET /resource/edit
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params2)
      redirect_to account_path(current_user)
    else
      flash[:notice] = "アカウント情報の変更に失敗しました"
      render :edit
    end
  end

  # DELETE /resource
  def destroy
    @user = current_user
    @user.destroy
    flash[:notice] ="アカウントを削除しました"
    redirect_to root_path
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

  def user_params1
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_params2
    params.require(:user).permit(:email, :password, :password)
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_account_update_params
  #devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  #end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
