class PasswordsResetsController < ApplicationController
  def new
    end

    def create
      @user = User.find_by(email: params[:password_reset][:email].downcase)
      if @user
        @user.create_reset_digest
        @user.send_password_reset_email
        flash[:info] = "Email sent with password reset instructions"
        redirect_to root_url
      else
        flash.now[:danger] = "Email address not found"
        render 'new'
      end
    end

    def edit
      # render json:[params]
      @user = User.find_by(email: params[:email].downcase)
    end

    def update
      # render json: params[:user][:email]
          @user = User.find_by(email: params[:user][:email])
          if @user.update(password: params[:user][:password])
            redirect_to root_path(@user)
          else
            render :edit
          end
    end

end
