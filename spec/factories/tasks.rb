FactoryGirl.define do
  factory :list do
    content "Test Task"

    factory :completed_task do
      status :complete
    end

  end
end
