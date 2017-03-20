class DrillGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_drill_group, except: [:index, :new, :create]
  before_action :authorize, except: [:index]

  def index
    @drill_groups = DrillGroup.order created_at: :desc
    @user         = current_user

    if @user.is_admin?
      render 'index_admin'
    else
      render 'index_user'
    end

  end

  def new
    @drill_group = DrillGroup.new
  end

  def create
    @drill_group = DrillGroup.new drill_group_params

    if @drill_group.save
      redirect_to @drill_group, success: 'Created New Drill Group!'
    else
      flash.now[:error] = 'Please fix the error below'
      render :new
    end
  end

  def show
    @drills = @drill_group.drills
    @drill = Drill.new
    @solutions = @drill.solutions
    1.times { solution = @drill.solutions.build }
  end

  def edit
  end

  def update
    if @drill_group.update drill_group_params
      redirect_to @drill_group, notice: 'Drill Group changed!'
    else
      flash.now[:error] = 'Please fix the error below'
      render :edit
    end
  end

  def destroy
    @drill_group.destroy
    redirect_to drill_groups_path
  end

  private

  def find_drill_group
    @drill_group = DrillGroup.find params[:id]
  end

  def drill_group_params
    drill_group_params = params.require(:drill_group).permit(:name,
                                                             :description,
                                                             :level,
                                                             :points)
  end

  def authorize
    if cannot?(:manage, @drill_group)
      redirect_to root_path, alert: 'Not authorized'
    end
  end
end
