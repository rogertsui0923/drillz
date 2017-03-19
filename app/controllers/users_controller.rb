class UsersController < ApplicationController
  def index
    # @users = Users.all
    @users = User.order(points: :desc, donuts: :desc)
  end

  def show
    #thanks for signing up!
  end

  def new
    @user = User.new
  end

  def profile
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    @user = User.new user_params

    if @user.save
      UsersMailer.notify_user_sign_up(@user).deliver_now!
      # session[:user_id] = @user.id
      # redirect_to root_path, notice: 'signed up'
      redirect_to user_path(:id)
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    user_params = params.require(:user).permit(:first_name, :last_name, :email)
    @user = current_user

        if @user.update(user_params)
          redirect_to root_path(@user)
        else
          render :edit
        end
  end


end
