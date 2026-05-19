class Job < ApplicationRecord
  validates :title, :company, :salary, :region, presence: true
  # validates :apply_url, presence: true, unless: :apply_email?
  # validates :apply_email, presence: true, unless: :apply_url?
  validate :has_apply_method

  def has_apply_method
    unless apply_url? || apply_email?
      errors.add(:base, "Please provide an apply URL or email")
    end
  end
end
