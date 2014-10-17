class SearchResultsController < ApplicationController

  def index
    @listuser = []
    @listgame = []
    @temp = []
    @fwd = params[:q].downcase.chars.sort { |a, b| a.casecmp(b) }.join
    @len_of_str = (Float(@fwd.length)/1.5).ceil
    User.all.each do |f|
      count = 0
      # @temp << f.username.downcase.chars.sort { |a, b| a.casecmp(b) }.join
      @fwd.length.times do |pfwd|
        count += 1 if f.username.downcase.include?(@fwd[pfwd])
      end
      @listuser << [f.id, count] if count >= @len_of_str
    end
    Game.all.each do |f|
      count = 0
      # @temp << f.name.downcase.chars.sort { |a, b| a.casecmp(b) }.join
      @fwd.length.times do |pfwd|
        count += 1 if f.name.downcase.include?(@fwd[pfwd])
      end
      @listgame << [f.id, count] if count >= @len_of_str
    end
    @fwd = @len_of_str
    @listuser = @listuser.sort_by{|x,y|y}.reverse
    @listgame = @listgame.sort_by{|x,y|y}.reverse
    respond_to do |format|
      format.html
      format.json {render json: @listgame}
    end
  end
end
