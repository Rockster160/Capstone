class Game < ActiveRecord::Base
    include PgSearch
    multisearchable :against => [:name]

    has_many :rules

end


# def bowling
#   @name = ""
#   @desc = ""
#   @howto = ["","",""] #Each do...
# end
