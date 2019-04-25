class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  def new
    Game.play
    redirect_to '/'
  end
end
