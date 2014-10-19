class Notification < ActiveRecord::Base
  belongs_to :user

  def formatted_ago
    time_diff = Time.now - self.created_at
    how_long_ago = case
    when (time_diff < 60)
      time_diff.round.to_s + " seconds ago"
    when (time_diff/60 < 60)
      (time_diff/60).round.to_s + " minutes ago"
    when (time_diff/60/60 < 24)
      (time_diff/60/60).round.to_s + " hours ago"
    when (time_diff/60/60/24 < 30)
      (time_diff/60/60/24).round.to_s + " days ago"
    when (time_diff*60/60/24/7 < 12)
      (time_diff*60/60/24/7).round.to_s + " weeks ago"
    when (time_diff*60/60/24/7/12 < 12)
      (time_diff*60/60/24/7/12).round.to_s + " months ago"
    else
      time_diff.round.to_s + " was really long ago"# "A really long time ago"
    end
    # how_long_ago = time_ago_in_words(self.created_at)
    return how_long_ago
  end

  def image_convert
    icon_id = self.icon
    myicon = case icon_id
    when 0
      "exclamation fa-circle"
    when 1
      "comment"
    when 2
      "trophy"
    when 3
      "usd fa-circle"
    when 4
      "bomb"
    else
      "question-circle"
    end
    return myicon
  end
end
