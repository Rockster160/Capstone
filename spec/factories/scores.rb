# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :score, :class => 'Scores' do
    userid 1
    gameid 1
    score 1
  end
end
