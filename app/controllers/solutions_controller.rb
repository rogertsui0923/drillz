class SolutionsController < ApplicationController
  before_action :find_solution , only: [:create, :destroy, :edit]

  def create
    correct = false
    solution_params = params.require(:solution).permit(:body)
    # @solution = Solution.new(solution_params)

    @solutions = Solution.where("drill_id = ?", params[:drill_id])


    @solutions.each do |s|
          if solution_params[:body].to_s == s.body
            correct = true
          end
    end

    if  correct
      # render plain: true
      redirect_to drill_path(params[:drill_id]), notice: 'SUCCESS!'
    else
      # render plain: false
      redirect_to drill_path(params[:drill_id]), alert: 'Not Correct'
    end

    # solution_params[:body]
    # @solution.drill = Drill.find params[:drill_id]
    # if @solution.save
    #   redirect_to drill_path(params[:drill_id]), notice: 'Correct'
    # else
    #   redirect_to drill_path(params[:drill_id]), alert: 'Fail to create solution'
    # end
  end

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
    @solution = Solution.find params[:drill_id]
  end

end
