class GroupSessionsController < ApplicationController
  before_action :authenticate_user!

  def create
    group_session = GroupSession.new(user: current_user,
                                     drill_group_id: params[:drill_group_id])

    group_session.save
    redirect_to drill_path(group_session.drill_group.drills.first)
  end

  def show
    donut = true
    @group_session = GroupSession.find params[:id]
    @drill_group   = @group_session.drill_group
    @drills         = @drill_group.drills

    @attempts = Attempt.where(user: current_user).order("created_at DESC").limit( @drill_group.drills.count)
    @attempts.each do |a|
      if !a.success
        donut = false
      end
    end

    if donut
      @user = User.find(current_user.id)
      @user.donuts = @user.donuts + 1
      @user.save
    end
  end
end
