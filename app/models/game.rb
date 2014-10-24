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

  def trophies
    Trophy.where(game_id: @game.id).reverse
  end

  def history
    UserGameLog.where(game_id: self.id).reverse
  end

  def daily
    day = UserGameLog.where(game_id: self.id).where("created_at > ?", (Time.now - 1.day)).order(:score).reverse.first
    day ||= self.history.first
  end

  def weekly
    week = UserGameLog.where(game_id: self.id).where("created_at > ?", (Time.now - 7.day)).order(:score).reverse.first
    week ||= self.history.first
  end

  def monthly
    month = UserGameLog.where(game_id: self.id).where("created_at > ?", (Time.now - 31.day)).order(:score).reverse.first
    month ||= self.history.first
  end

  def alltime
    all = UserGameLog.where(game_id: self.id).order(:score).reverse.first
    all ||= self.history.first
  end

  def checker(score)
  end
end
