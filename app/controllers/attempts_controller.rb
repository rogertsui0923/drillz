class AttemptsController < ApplicationController
  before_action :authenticate_user!

  def create
    correct = false
    solution_params = params.require(:attempt).permit(:body)
    @drill = Drill.find(params[:drill_id])
    @group_session = GroupSession.order(id: :desc).find_by(user: current_user,
                                          drill_group: @drill.drill_group)
    @attempt = Attempt.create(user: current_user,
                              group_session: @group_session,
                              drill: @drill)
    @solutions = Solution.where("drill_id = ?", params[:drill_id])
    @solutions.each do |s|
      reg = Regexp.new('^'+Regexp.escape(solution_params[:body].to_s.gsub(/\s+/, "").downcase)+'$')
      if reg.match(s.body.to_s.gsub(/\s+/, "").downcase)
        correct = true
      end
    end
    if correct
      @attempt.success = true
      @attempt.body = solution_params[:body]
      @attempt.save
      @group_session.points =  @group_session.points +  @group_session.drill_group.points
      @group_session.save
      flash[:submitted] = true
      @user = User.find(current_user.id)
      @user.points = @user.points + @group_session.drill_group.points
      @user.save
      redirect_to drill_path(params[:drill_id]), success: 'SUCCESS!'
    else
      @attempt.body = solution_params[:body]
      @attempt.save
      flash[:submitted] = true
      redirect_to drill_path(params[:drill_id]), alert: 'Not Correct'
    end
  end
end
