class GroupSessionsController < ApplicationController
  def create
    group_session = GroupSession.new(user: current_user,
                                     drill_group_id: params[:drill_group_id])

    group_session.save
    redirect_to drill_path(group_session.drill_group.drills.first)
  end

  def show
    @group_session = GroupSession.find params[:id]
    @drill_group = @group_session.drill_group
  end

end
