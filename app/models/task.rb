class Task < ActiveRecord::Base
  belongs_to :list
  has_one :user, :through => :list

  enum status: [:incomplete, :complete]

  validates :content, :list_id, :presence => true
  validates :content, :uniqueness => { :scope => :list }
end
