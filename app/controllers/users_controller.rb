class UsersController < ApplicationController

  before_filter :authenticate_user!


  def show
    @user = User.find(current_user.id)

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
       @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, alert: 'Profil was successfully updated.'
    else
      render :edit

    end

  end





  private

  def user_params
    params.require(:user).permit(:last_name,:first_name,:encrypted_password,:email,:photo, :photo_cache)
  end



end
