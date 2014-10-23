class Game < ActiveRecord::Base
  include ::Formatter
  has_many :scores
  has_many :shouts
  has_many :user_game_statistics
  has_many :user_game_logs

  def mapScoreToCoin(score)
    score = score.to_i
    scoreRange = self.detailscore
    output_start = Float(1)
    output_end = Float(500)
    input_start = Float(scoreRange.first)
    input_end = Float(scoreRange.last)
    output =  (output_start + ((output_end - output_start) / (input_end - input_start)) * (score - input_start))
    return output.round
  end

  def checker(score)
  end
end
