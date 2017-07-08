class Deadline < ActiveRecord::Base
  validates :time, :presence => true

  belongs_to :list
  has_one :user, :through => :list

  after_create :reminder

  @@REMINDER_TIME = 30.minutes

  def reminder
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    reminder = "Hi #{self.user.username}. Just a reminder, your list #{self.list.title} is incomplete and due in 30 minutes"
    message = @client.messages.create(
      :from => @twilio_number,
      :to => self.user.phone_number,
      :body => reminder,
    )
    puts message.to
  end

  def when_to_run
    time - @@REMINDER_TIME
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
