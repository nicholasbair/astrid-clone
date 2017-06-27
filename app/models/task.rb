class Task < ActiveRecord::Base
  belongs_to :list

  enum :status [:incomplete, :complete]
end
