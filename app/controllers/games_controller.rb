class GamesController < ApplicationController
  def create
  end

  def read
  end

  def update
  end

  def destroy
  end
end

# rails g controller Games create read update destroy
#       create  app/controllers/games_controller.rb
#        route  get 'games/destroy'
#        route  get 'games/update'
#        route  get 'games/read'
#        route  get 'games/create'
#       invoke  erb
#       create    app/views/games
#       create    app/views/games/create.html.erb
#       create    app/views/games/read.html.erb
#       create    app/views/games/update.html.erb
#       create    app/views/games/destroy.html.erb
#       invoke  rspec
#       create    spec/controllers/games_controller_spec.rb
#       create    spec/views/games
#       create    spec/views/games/create.html.erb_spec.rb
#       create    spec/views/games/read.html.erb_spec.rb
#       create    spec/views/games/update.html.erb_spec.rb
#       create    spec/views/games/destroy.html.erb_spec.rb
#       invoke  helper
#       create    app/helpers/games_helper.rb
#       invoke    rspec
#       create      spec/helpers/games_helper_spec.rb
#       invoke  assets
#       invoke    coffee
#       create      app/assets/javascripts/games.js.coffee
#       invoke    scss
#       create      app/assets/stylesheets/games.css.scss
