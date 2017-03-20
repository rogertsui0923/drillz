class HomeController < ApplicationController

  def home
    if current_user == nil
      render 'home', layout: false
    else
      redirect_to drill_groups_path
    end
  end
end
