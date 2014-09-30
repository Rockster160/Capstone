class Game < ActiveRecord::Base
end

# rails g model Game name about:text howto:text cost:integer
#       invoke  active_record
#       create    db/migrate/20140930173008_create_games.rb
#       create    app/models/game.rb
#       invoke    rspec
#       create      spec/models/game_spec.rb
