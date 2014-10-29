module Formatter
  def formatted_ago
    time_diff = Time.now - self.created_at
    how_long_ago = case
    when (time_diff < 60)
      time_diff.round.to_s + " seconds ago"
    when ((time_diff/60).round == 1)
      (time_diff/60).round.to_s + " minute ago"
    when (time_diff/60 < 60)
      (time_diff/60).round.to_s + " mins ago"
    when ((time_diff/60/60).round == 1)
      (time_diff/60/60).round.to_s + " hour ago"
    when (time_diff/60/60 < 20)
      (time_diff/60/60).round.to_s + " hours ago"
    when (time_diff/60/60 < 40)
      "Yesterday"
    when (time_diff/60/60/24 < 30)
      (time_diff/60/60/24).round.to_s + " days ago"
    when (time_diff*60/60/24/7 < 12)
      (time_diff*60/60/24/7).round.to_s + " weeks ago"
    when (time_diff*60/60/24/7/12 < 30)
      (time_diff*60/60/24/7/12).round.to_s + " months ago"
    else
      "A long time ago"
    end
    return how_long_ago
  end

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
end
