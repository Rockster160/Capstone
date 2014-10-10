class Rule < ActiveRecord::Base
  belongs_to: user
  belongs_to: game

  def self.check_conditions_for(user)
    if !user.awarded(self) and user.games.size > 0
      user.award(self)
    end
  end
end
