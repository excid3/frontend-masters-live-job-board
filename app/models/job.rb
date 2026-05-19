class Job < ApplicationRecord
  belongs_to :user, optional: true

  has_rich_text :description

  scope :weekly_summary, -> { where(created_at: 1.week.ago..) }

  after_create_commit -> { broadcast_action_later_to :jobs, action: :prepend, target: :jobs }
  after_update_commit -> { broadcast_replace_later }
  after_destroy_commit -> { broadcast_remove }

  validates :title, :company, :salary, :region, presence: true
  # validates :apply_url, presence: true, unless: :apply_email?
  # validates :apply_email, presence: true, unless: :apply_url?
  validate :has_apply_method

  def has_apply_method
    unless apply_url? || apply_email?
      errors.add(:base, "Please provide an apply URL or email")
    end
  end

  # to_param :title
  # to_param :title_and_company

  def to_param
    [id, title, "at", company].join("-").parameterize
  end

  def owner?
    user_id? && user == Current.user
  end
end
