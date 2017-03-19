class AttemptsController < ApplicationController
  before_action :find_solution, except: [:index, :create]

  def create
    correct = false
    solution_params = params.require(:solution).permit(:body)
    @drill = Drill.find(params[:drill_id])
    @groupSession = GroupSession.find_by(user: current_user, drill_group: @drill.drill_group_id)
    @attempt = Attempt.create(user: current_user , group_session: @groupSession, drill: @drill)
    @solutions = Solution.where("drill_id = ?", params[:drill_id])
    @solutions.each do |s|
     if solution_params[:body].to_s.gsub(/\s+/, "").downcase == s.body.to_s.gsub(/\s+/, "").downcase
      correct = true
     end
    end
    if  correct
      @attempt.success = true
      @attempt.save
      @groupSession.points =  @groupSession.points +  @groupSession.drill_group.points
      @groupSession.save
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
