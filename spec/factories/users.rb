FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    username "Test User"
    email "test@example.com"
    password "password"

    # trait :admin do
    #   role 'admin'
    # end

  end
end
