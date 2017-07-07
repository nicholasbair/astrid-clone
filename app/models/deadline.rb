class Deadline < ActiveRecord::Base
  validates :date, :presence => true

  belongs_to :list
  has_one :user, :through => :list
end
