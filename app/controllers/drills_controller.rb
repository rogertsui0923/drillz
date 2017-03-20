class DrillsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_drill, only: [:destroy, :update, :edit, :show]
  before_action :authorize, except: [:show]

  def create
    @drill = Drill.new(drill_params)
    @drill_group = DrillGroup.find params[:drill_group_id]
    @drill.drill_group = @drill_group

    if @drill.save
      redirect_to @drill_group
    else
      redirect_to @drill_group, error: 'Fail to create Drill'
    end
  end

  def show
    @attempt = Attempt.new
    @group_session = GroupSession.find_by(user: current_user,
                                          drill_group: @drill.drill_group_id)
  end

  def update
    @drill_group = @drill.drill_group

    if @drill.update drill_params
      redirect_to @drill_group, success: 'Update successful'
    else
      redirect_to @drill_group, error: 'Update Failed'
    end
  end

  def edit
  end

  def destroy
    if @drill.destroy
      redirect_to @drill.drill_group, notice: 'Drill is destroyed'
    else
      redirect_to @drill.drill_group, alert: 'Cannot destroy View'
    end
  end

  private

  def find_drill
    @drill = Drill.find params[:id]
  end

  def drill_params
    drill_params = params.require(:drill).permit(:description,
                                                  { solutions_attributes:
                                                    [:id,
                                                     :body,
                                                     :_destroy] })
  end

  def authorize
    if cannot?(:manage, @drill)
      redirect_to root_path, alert: 'Not authorized'
    end
  end
end
