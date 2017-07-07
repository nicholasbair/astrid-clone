class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  enum status: [:incomplete, :in_progress, :complete]

  validates :title, :presence => true
  validates :title, :uniqueness => { :scope => :user }

  def tasks_attributes=(tasks_attributes)
    tasks_attributes.values.each do |task_attribute|
      self.tasks << Task.create(task_attribute)
    end
  end

  def check_status
    case
    when self.tasks.all? { |task| task.status == "incomplete" }
      self.status = "incomplete"
    when self.tasks.all? { |task| task.status == "complete" }
      self.status = "complete"
    when self.tasks.any? { |task| task.status == "complete" || task.status == "in_progress" }
      self.status = "in_progress"
    end

    self.save
  end

end
