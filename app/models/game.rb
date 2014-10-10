class Game < ActiveRecord::Base
    has_many :scores
    
    include PgSearch
    multisearchable :against => [:name]
end

# def bowling
#   @name = ""
#   @desc = ""
#   @howto = ["","",""] #Each do...
# end
