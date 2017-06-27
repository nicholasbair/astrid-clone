FactoryGirl.define do
  factory :list do
    title "Test List"

    factory :completed_list do
      status :complete
    end

  end
end
