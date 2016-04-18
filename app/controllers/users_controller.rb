class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:current_user_id] = user.id
      redirect_to links_path
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session[:current_user_id] = []
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
