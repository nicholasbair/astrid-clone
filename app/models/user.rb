class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :tasks, :through => :lists

  validates :username, :presence => true

  def self.most_completed_tasks
    results = self.joins(:lists).where(lists: { status: "complete" }).limit(5).group("lists.user_id").count
    self.parse_results(results)
  end

  def self.parse_results(results_hash)
    results_hash.collect do |item|
      { :user => User.find(item[0]), :quantity => item[1] }
    end
  end
end
