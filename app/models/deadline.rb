class Deadline < ActiveRecord::Base
  validates :time, :presence => true

  belongs_to :list
  has_one :user, :through => :list

  after_create :reminder

  def reminder
    if !self.list.complete?
      @twilio_number = ENV['TWILIO_NUMBER']
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      reminder = "Hi. Just a reminder, your list #{self.list.title} is incomplete and due in 5 minutes"
      message = @client.messages.create(
        :from => @twilio_number,
        :to => self.user.phone_number,
        :body => reminder,
      )
      puts message.to
    end
  end

  def when_to_run
    reminder_time = 5.minutes
    Time.zone.parse(time.to_s).utc - reminder_time
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
