class UsersController < ApplicationController
  def index
    # @users = Users.all
    @users = User.order(points: :desc, donuts: :desc).limit(20)
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def signup
    # thanks for signing up
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    @user = User.new user_params

    if @user.save
      @admins = User.where(is_admin: true)

      @admins.each do |admin|
        UsersMailer.notify_user_sign_up(@user, admin).deliver_now!
      end
      # session[:user_id] = @user.id
      # redirect_to root_path, notice: 'signed up'
      redirect_to signup_users_path
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

  def update_password

    @user = current_user

    if @user.authenticate(params[:current_password])

      if params[:current_password] === params[:password]
        flash.now[:alert] =  "Passwords must be different than before"
        render :edit
      elsif @user.update(password: params[:password], password_confirmation: params[:password_confirmation])
        redirect_to root_path(@user), notice: 'Password Updated'
      else
        flash.now[:alert] =  "Passwords don't match"
        render :edit
      end

    else
      flash.now[:alert] = "Current password is Incorrect"
      render :edit
    end
  end

end
