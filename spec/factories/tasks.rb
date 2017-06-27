FactoryGirl.define do
  factory :task do
    content "Test Task"

    factory :completed_task do
      status :complete
    end

  end
end
