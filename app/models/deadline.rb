class Deadline < ActiveRecord::Base
  validates :date, :presence => true

  belongs_to :list
  belongs_to :user
end
