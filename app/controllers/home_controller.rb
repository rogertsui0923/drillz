class HomeController < ApplicationController

  def index
    render 'home', layout: false
  end
end
