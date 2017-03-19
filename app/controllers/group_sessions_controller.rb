class GroupSessionsController < ApplicationController

  def create
      groupSession = GroupSession.new(user: current_user , drill_group: params[:drill_group_id])
      if groupSession.save
        redirect_to drill_path(groupSession.drill_group.drills.first)
      else
      end
  end
end
