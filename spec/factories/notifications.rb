# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification, :class => 'Notifications' do
    userid 1
    message "MyString"
    isRead false
    gold 1
  end
end
