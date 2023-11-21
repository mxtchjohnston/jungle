class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)

    if !user.valid?
      redirect_to '/signup', notice: user.errors.full_messages
     
    else
      user.save
      session[:user_id] = user.id
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first, :last, :email, :password, :password_confirmation)
  end
  
  
end
