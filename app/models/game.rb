class Game < ActiveRecord::Base
    include PgSearch
    multisearchable :against => [:name]
end

# def bowling
#   @name = ""
#   @desc = ""
#   @howto = ["","",""] #Each do...
# end
