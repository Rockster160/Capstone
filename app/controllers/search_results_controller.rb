#Retrieves input from search bar, performs the search and sends the information back.
class SearchResultsController < ApplicationController

  def index
    @listuser = []
    @listgame = []
    @temp = []
    @fwd = params[:q].downcase.chars.sort { |a, b| a.casecmp(b) }.join
    @length = @fwd.length
    @len_of_str = (Float(@length)/1.5).ceil
    User.all.each do |user|
      count = 0
      @length.times do |pfwd|
        count += 1 if user.username.downcase.include?(@fwd[pfwd])
      end
      @listuser << [user.id, count] if count >= @len_of_str
    end
    Game.all.each do |game|
      count = 0
      @length.times do |pfwd|
        count += 1 if game.name.downcase.include?(@fwd[pfwd])
      end
      @listgame << [game.id, count] if count >= @len_of_str
    end
    @fwd = @len_of_str
    @listuser = @listuser.sort_by{|x,y|y}.reverse
    @listgame = @listgame.sort_by{|x,y|y}.reverse
    liveResults = []
    @listgame.each do |x|
      #binding.pry
      game = Game.find(x[0])
      liveResults << [ game.id, game.name, game.ava ]
    end
    respond_to do |format|
      format.html
      format.json {render json: liveResults.to_json }
    end
  end
end
