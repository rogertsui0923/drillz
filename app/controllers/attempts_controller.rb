class AttemptsController < ApplicationController
  before_action :authenticate_user!
  # before_action :find_solution, only: :create

  def create
    correct = false
    solution_params = params.require(:solution).permit(:body)

    @drill = Drill.find(params[:drill_id])
    @group_session = GroupSession.find_by(user: current_user,
                                          drill_group: @drill.drill_group_id)
    @attempt = Attempt.create(user: current_user,
                              group_session: @group_session,
                              drill: @drill)
    @solutions = Solution.where("drill_id = ?", params[:drill_id])

    @solutions.each do |s|
     if solution_params[:body].to_s.gsub(/\s+/, "")
                              .downcase == s.body.to_s
                              .gsub(/\s+/, "")
                              .downcase
      correct = true
     end
    end

    if correct
      @attempt.success = true
      @attempt.body = solution_params[:body]
      @attempt.save
      @group_session.points =  @group_session.points +  @group_session.drill_group.points
      @group_session.save
      redirect_to drill_path(params[:drill_id]), success: 'SUCCESS!'
     else
      @attempt.body = solution_params[:body]
      @attempt.save
      redirect_to drill_path(params[:drill_id]), alert: 'Not Correct'
     end
  end

  private
  def find_solution
    @solution = Solution.find params[:drill_id]
  end
end
