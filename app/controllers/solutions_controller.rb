class SolutionsController < ApplicationController
  before_action :find_solution , only: [:create, :destroy, :edit]

  # def create
  #   @solution = Solution.new(solution_params)
  #   @drill = Drill.find params[:drill_id]
  #   @solution.drill = @solution
  #   if @solution.save
  #     redirect_to @drill_group
  #   else
  #     redirect_to @drill_group, alert: 'Fail to create solution'
  #   end
  # end

  # def destroy
  #   if @solution.destroy
  #     redirect_to @drill_group, notice: 'Solution is destroyed'
  #   else
  #     redirect_to @drill_group, alert: 'Cannot destroy solution'
  #   end
  # end

  def edit
  end

  # implement later
  # def update
  #   @drill_group = DrillGroup.find params[:drill_group_id]
  #   @drill.drill_group  = @drill_group
  #   @solution.drill = @drill
  #   if @solution.update params[:form_field]
  #     redirect_to @drill_group, notice: 'Update successful'
  #   else
  #     redirect_to @drill_group, alert: 'Update Failed'
  #   end
  # end

  private

  def find_solution
    @solution = Solution.find params[:id]
  end

  def solution_params
    solution_params = params.require(:solution).permit(:body)
  end
end
