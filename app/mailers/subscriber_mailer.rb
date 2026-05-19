class SubscriberMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.weekly_summary.subject
  #
  def weekly_summary
    mail to: params[:subscriber].email
  end
end
