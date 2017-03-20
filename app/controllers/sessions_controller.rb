class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email params[:email]
      if @user&.authenticate params[:password]
        if @user.is_approved?
          session[:user_id] = @user.id
          redirect_to drill_groups_path, notice: 'Signed in!'
        else
          redirect_to root_path, alert: 'Your account hasn\'t been authenticated yet'
        end

      else
        flash.now[:error] = 'Wrong credentials'
        render :new
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out!'
  end
end
