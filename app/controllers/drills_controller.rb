class DrillsController < ApplicationController
  before_action :find_drill , only: [:destroy, :update, :edit]

  def create
    @drill = Drill.new(drill_params)
    @drill_group = DrillGroup.find params[:drill_group_id]
    @drill.drill_group = @drill_group
    if @drill.save
      redirect_to @drill_group
    else
      redirect_to @drill_group, notice: 'Fail to create Drill'
    end
  end

  def update
    @drill_group = DrillGroup.find params[:drill_group_id]
    @drill.drill_group = @drill_group
    if @drill.update params[:id]
      redirect_to @drill_group, notice: 'Update successful'
    else
      redirect_to @drill_group, notice: 'Update Failed'
    end
  end

  def edit
    @drill_group = DrillGroup.find params[:drill_group_id]
    @drill.drill_group = @drill_group
  end

  def destroy
    if @drill.destroy
      redirect_to @drill_group, notice: 'Drill is destroyed'
    else
      redirect_to @drill_group, notice: 'Cannot destroy View'
    end
  end

  private
  def find_drill
    @drill = Drill.find params[:id]
  end

  def drill_params
    drill_params =  params.require(:drill).permit(:description, :drill_group_id)
  end
end
