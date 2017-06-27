FactoryGirl.define do
  factory :user do
    username "Test User"
    email "test@example.com"
    password "password"
  end

  factory :user2 do
    username "Test User2"
    email "test2@example.com"
    password "password"
  end
end
