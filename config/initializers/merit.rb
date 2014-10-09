# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

Merit::Badge.create! (
  id: 0,
  name: "first-game-completed",
  description: "You completed your first game!",
  custom_fields: { difficulty: :easy }
)

Merit::Badge.create! (
  id: 1,
  name: "personal-high-score-reached",
  description: "You set your personal high score!",
  custom_fields: { difficulty: :medium }
)

Merit::Badge.create! (
  id: 2,
  name: "daily-high-score-reached",
  description: "You have the daily high score for this game!",
  custom_fields: { difficulty: :hard }
)

Merit::Badge.create! (
  id: 3,
  name: "weekly-high-score-reached",
  description: "You have the weekly high score for this game!",
  custom_fields: { difficulty: :hard }
)

Merit::Badge.create! (
  id: 4,
  name: "monthly-high-score-reached",
  description: "You have the monthly high score for this game!",
  custom_fields: { difficulty: :hard }
)

Merit::Badge.create! (
  id: 5,
  name: "first-level-completed",
  description: "You completed the first level of this game!",
  custom_fields: { difficulty: :easy }
)

Merit::Badge.create! (
  id: 6,
  name: "first-five-levels-completed",
  description: "You completed the first five levels of this game!",
  custom_fields: { difficulty: :medium }
)

Merit::Badge.create! (
  id: 7,
  name: "all-levels-completed",
  description: "You completed all the levels of this game!",
  custom_fields: { difficulty: :hard }
)

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
