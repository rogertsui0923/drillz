class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize

  def create
    @drill_group = DrillGroup.find params[:drill_group_id]
    @favourite   = Favourite.new(user: current_user, drill_group: @drill_group)

    if @favourite.save
      redirect_to drill_groups_path, notice: 'Added on My Drills!'
    else
      redirect_to drill_groups_path, notice: 'You already have this Drillzzzz'
    end
  end

  def destroy
    @favourite = Favourite.find params[:id]

    if @favourite.destroy
      redirect_to drill_groups_path, notice: 'Drillzzzz Removed!'
    else
      flash[:now] = 'Something is wrong...'
      render 'drill_groups/index_user'
    end
  end

  private

  def authorize
    if cannot? :manage, @favourite
      redirect_to drill_groups_path, alert: 'Are you admin? 🤔'
    end
  end

end
