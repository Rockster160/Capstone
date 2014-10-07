class SearchResultsController < ApplicationController

  def index
    @searchres = PgSearch.multisearch(params[:q]).where(:searchable_type => "User").collect(&:searchable)

    User.all.each do |f|
      searched = params[:q].downcase
      if searched == f.username.downcase
        @fwd = "./users/"+f.id.to_s
        break
      # elsif searched ==
      #   @fwd =
      #   break
      else
        @fwd = params[:q]
      end
      # binding.pry
    end
  end
end
