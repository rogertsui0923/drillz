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
      #Idea on implementing the point system
      #get the current sign-in user id to obtain the drill_group_id from the GroupSession
      #from the drill group get the base point and difficutly level
      #Calculate the points in the based on difficulty and add it to the
      #GroupSession's point
      # We can add the calculated points when the user answers correctly here
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
