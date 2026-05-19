class Subscriber < ApplicationRecord
  validates :email, presence: true

  generates_token_for :unsubscribe

  def self.send_weekly_summary
    find_each do
      SubscriberMailer.with(subscriber: it).weekly_summary.deliver_later
    end
  end
end
