class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :find_user, only: %i[show]
  before_action :find_logged_in_user, only: %i[edit]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('notice.update')
    else
      flash.now[:error] = t 'flash.error_on_update'
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def find_logged_in_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end

