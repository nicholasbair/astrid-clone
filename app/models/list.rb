class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, :dependent => :destroy
  has_one :deadline, :dependent => :destroy

  enum status: [:incomplete, :in_progress, :complete]

  validates :title, :presence => true
  validates :title, :uniqueness => { :scope => :user }
  validates_associated :deadline

  def tasks_attributes=(tasks_attributes)
    tasks_attributes.values.each do |task_attribute|
      self.tasks << Task.create(task_attribute)
    end
  end

  def deadline_attributes=(deadline_attributes)
    if deadline_attributes[:time].present?
      self.deadline = Deadline.create(parse_time_attributes(deadline_attributes))
    end
  end

  def parse_time_attributes(attributes)
    Time.zone = attributes[:time_zone]
    attributes[:time] = Time.parse(attributes[:time].gsub(/T/, " ")).utc

    attributes
  end

  def check_status
    case
    when self.tasks.size == 1
      self.status = self.tasks.first.status
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
    Time.zone = self.user.time_zone
    self.deadline.time < Time.zone.now
  end

end
