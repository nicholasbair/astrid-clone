class SendDeadlineReminderJob < ActiveJob::Base
  queue_as :default

  def perform(deadline)
    NewDeadlineReminderService.new(deadline.reminder)
  end
end
