class SolutionsController < ApplicationController
  before_action :find_solution , only: [:create, :destroy, :edit]

  def create
    correct = false
    solution_params = params.require(:solution).permit(:body)
    @solutions = Solution.where("drill_id = ?", params[:drill_id])
    @solutions.each do |s|
      if solution_params[:body].to_s == s.body
        correct = true
      end
    end
    if  correct
      redirect_to drill_path(params[:drill_id]), notice: 'SUCCESS!'
    else
      redirect_to drill_path(params[:drill_id]), alert: 'Not Correct'
    end
  end

  private
  def find_solution
    @solution = Solution.find params[:drill_id]
  end
end
