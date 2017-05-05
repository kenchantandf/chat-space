class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_with_password(user_params)
      redirect_to root_path, notice: 'アカウント情報を変更しました'
    else
      flash.now[:alert] = 'アカウント情報を変更できませんでした'
      render :edit
    end
  end

  def search
    @users = User.where('name LIKE(?) AND id != ?', "#{params[:name]}%", current_user)
    respond_to do |format|
      format.json
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
