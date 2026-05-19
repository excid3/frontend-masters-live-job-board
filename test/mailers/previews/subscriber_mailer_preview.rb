# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/subscriber_mailer/weekly_summary
  def weekly_summary
    SubscriberMailer.with(
      subscriber: Subscriber.last || Subscriber.new,
      jobs: Job.all
    ).weekly_summary
  end
end
