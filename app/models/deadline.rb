class Deadline < ActiveRecord::Base
  validates :time, :presence => true
  validates :reminder_interval, :presence => true
  validate :time_must_be_in_the_future
  validate :reminder_must_be_in_the_future

  belongs_to :list
  has_one :user, :through => :list

  after_create :reminder

  def time_must_be_in_the_future
    errors.add(:time, "must be in the future.") unless Time.now < time
  end

  def reminder_must_be_in_the_future
    errors.add(:reminder_interval, "must be in the future.") unless Time.now < (time - reminder_interval.minutes)
  end

  def reminder
    if !self.list.complete?
      @twilio_number = ENV['TWILIO_NUMBER']
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      reminder = "Hi. Just a reminder, your list #{self.list.title} is incomplete and due in #{reminder_interval.to_s} minutes"
      message = @client.messages.create(
        :from => @twilio_number,
        :to => "1#{self.user.phone_number}",
        :body => reminder,
      )
      puts message.to
    end
  end

  def when_to_run
    reminder_time = reminder_interval.minutes
    Time.zone.parse(time.to_s).utc - reminder_time
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
