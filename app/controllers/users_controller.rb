class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)

                # sesson[:user_id] = @user.id <----- need naris session

    @user = User.new user_params

    if @user.save
      redirect_to root_path, notice: 'signed up'
    else
      render :new
    end
  end
end
