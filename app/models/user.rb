class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :tasks, :through => :lists

  # All users with completed lists
  # User.joins(:lists).where(lists: {status: 1})

  def self.most_completed_tasks

  end

end
