# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_game_statistic do
    user_id 1
    game_id 1
    count 1
  end
end
