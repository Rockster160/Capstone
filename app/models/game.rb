class Game < ActiveRecord::Base
    has_many :scores
    has_many :shouts
    has_many :user_game_statistics
    has_many :user_game_logs

    def detailscore
      details = case self.id
      when 1
        0...300
      when 2
        0...50
      when 3
        0...500
      when 4
        13...0
      when 5
        0...50
      when 6
        0...5000
      when 7
        0...11
      when 8
        0...100
      end
    end

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
end
