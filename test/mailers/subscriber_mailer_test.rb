require "test_helper"

class SubscriberMailerTest < ActionMailer::TestCase
  test "weekly_summary" do
    mail = SubscriberMailer.with(subscriber: subscribers(:one)).weekly_summary
    assert_equal "New jobs this week", mail.subject
    assert_equal [ "one@example.com" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Unsubscribe", mail.body.encoded
  end
end
