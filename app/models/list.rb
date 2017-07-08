class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, :dependent => :destroy
  has_one :deadline, :dependent => :destroy

  enum status: [:incomplete, :in_progress, :complete]

  validates :title, :presence => true
  validates :title, :uniqueness => { :scope => :user }

  def tasks_attributes=(tasks_attributes)
    tasks_attributes.values.each do |task_attribute|
      self.tasks << Task.create(task_attribute)
    end
  end

  def deadline_attributes=(deadline_attributes)
    binding.pry
    #  Time.zone.parse(t).utc
    # Need to convert the input time to UTC time
    # How do we know what time zone the user is in?
    # user.timezone
    self.deadline = Deadline.create(deadline_attributes)
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

  def self.available_lists
    self.where("status = ? OR status = ?", 0, 1)
  end

  def overdue?
    true unless self.deadline.time > Time.zone.now
    # Time.past?()
  end

end
