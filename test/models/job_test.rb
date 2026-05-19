require "test_helper"

class JobTest < ActiveSupport::TestCase
  test "validates apply url or email is present" do
    job = Job.new apply_url: "https://gorails.com"
    job.valid?
    assert_empty job.errors[:base]

    job = Job.new apply_email: "hr@gorails.com"
    job.valid?
    assert_empty job.errors[:base]

    job = Job.new
    job.valid?
    assert_includes job.errors[:base], "Please provide an apply URL or email"
  end

  test "weekly summary does not include old jobs" do
    assert_not_includes Job.weekly_summary, jobs(:old_job)
  end
end
