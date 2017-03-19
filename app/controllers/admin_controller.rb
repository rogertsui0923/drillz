class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize

  def index
    @users = User.order(created_at: :desc)
  end

  def update
    @user = User.find(params[:is_approved])

    if params[:is_approved]
      @user.update_attribute(:is_approved, true)
      
      redirect_to admin_index_path(current_user)
    end
    # render json: params
  end

private

  def authorize
    head :unauthorized unless current_user.is_admin?
  end

end
