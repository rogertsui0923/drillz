class UsersController < ApplicationController
  def home

  end

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
      redirect_to user_path(@user), notice: 'Account updated!'
    else
      render :edit
    end
  end

  def password
    user_params = params.permit(:password, :password_confirmation)
    old = params[:current_password]
    @user = User.find params[:user_id]
    if !@user&.authenticate(old)
      flash[:modal] = true
      @user.errors.add(:current_password, 'mismatch')
      render :edit
    elsif old == user_params[:password] && old == user_params[:password_confirmation]
      flash[:modal] = true
      @user.errors.add(:password, 'should be different from old password')
      render :edit
    elsif @user.update user_params
      redirect_to edit_user_path(@user), notice: 'Password updated!'
    else
      flash.now[:alert] = 'Please fix errors!'
      flash[:modal] = true
      render :edit
    end

  end

end
