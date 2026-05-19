require "test_helper"

class SubscriberTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "send weekly summary" do
    Subscriber.send_weekly_summary
    assert_enqueued_jobs 2
  end
end
