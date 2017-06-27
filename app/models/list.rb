class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  enum status: [:incomplete, :complete]

  validates :title, :presence => true
  validates :title, :uniqueness => { :scope => :user }
end
