class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  
  def new
    @user = User.new
  end

  def create
    @user =  User.new(user_params1)
    if @user.save
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
      flash[:notice] = "アカウント情報を変更しました"
      redirect_to root_path
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

  private

  def user_params1
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_params2
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
