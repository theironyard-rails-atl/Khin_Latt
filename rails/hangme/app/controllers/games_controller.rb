# Note the plural
class GamesController < ApplicationController # to inherit from generated class
  def index #display a collection of games
    @games = Game.all
  end

  def show
    id = params[:id]
    @game = Game.find(id)
  end
#******** don't forget g.save! to get proper ID
  # def new
  #   @game = Game.new
  # end

  # def edit
  #   id = params[:id]
  #   @game = Game.find(id)
  #   redirect_to game_path(@game)
  # end

  def create
    @game = Game.new
    @game.answer = WORDS.sample
    @game.guessed = ''
    @game.save!
    redirect_to game_path(@game)
  end

  def update
    id = params[:id]
    @game = Game.find(id)
    letter = params[:letter]
    @game.guess(letter)
    redirect_to @game
    # Equivalently,
    # redirect_to game_path(@game)
    # redirect_to "/games/#{@game.id}"
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end
  #
  # def new
  #   # next_id = ( @games.last.id || 0 ) + 1
  #   @game = Game.new
  #   # redirect to("games/#{@game.id}")
  # end
  # # def edit # to lead to another page and go back to update
  # #
  # # end
  #
  # #there is post as well
  #
  # def patch # to update some parts
  #   @letter = params[:letter]
  #   @hit = @game.guess(@letter)
  # end
  def current_user
    User.find session[:selected_user]
  end
end
