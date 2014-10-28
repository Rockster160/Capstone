class Notification < ActiveRecord::Base
  include ::Formatter
  belongs_to :user

  def image_convert
    icon_id = self.icon
    myicon = case icon_id
    when 0
      "exclamation"
    when 1
      "comment"
    when 2
      "trophy"
    when 3
      "usd"
    when 4
      "chain-broken"
    else
      "question-circle"
    end
    return myicon
  end
end

