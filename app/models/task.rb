class Task < ActiveRecord::Base
  belong_to :list

  enum :status [:incomplete, :complete]
end
