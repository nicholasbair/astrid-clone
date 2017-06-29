class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  enum status: [:incomplete, :complete]

  validates :title, :user_id, :presence => true
  validates :title, :uniqueness => { :scope => :user }

  def tasks_attributes=(tasks_attributes)
    tasks_attributes.values.each do |task_attribute|
      task = Task.create(task_attribute)
      self.tasks << task
    end
  end
end
