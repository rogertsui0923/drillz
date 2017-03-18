class FavouritesController < ApplicationController
  def create
    @drill_group = DrillGroup.find params[:drill_group_id]
    @favourite = Favourite.new user: current_user, drill_group: @drill_group

    if @favourite.save
      
    end
  end
end
