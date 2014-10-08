class SearchResultsController < ApplicationController

  def index
    searchuser = PgSearch.multisearch(params[:q]).where(:searchable_type => "User").collect(&:searchable)
    searchgame = PgSearch.multisearch(params[:q]).where(:searchable_type => "Game").collect(&:searchable)
    @listuser = []
    @listgame = []
    @temp = []
    @fwd = params[:q].downcase.chars.sort { |a, b| a.casecmp(b) }.join
    len_of_str = (Float(@fwd.length)/1.5).ceil
    User.all.each do |f|
      count = 0
      @temp << f.username.downcase.chars.sort { |a, b| a.casecmp(b) }.join
      @fwd.length.times do |pfwd|
        count += 1 if f.username.include?(@fwd[pfwd])
      end
      @listuser << f.username if count >= len_of_str
    end
    Game.all.each do |f|
      count = 0
      @temp << f.name.downcase.chars.sort { |a, b| a.casecmp(b) }.join
      @fwd.length.times do |pfwd|
        count += 1 if f.name.include?(@fwd[pfwd])
      end
      @listgame << f.name if count >= len_of_str
    end
    @fwd = len_of_str
  end
end
