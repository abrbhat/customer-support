class SupportRequest < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :subject, presence: true

  after_initialize :init

  private

  def init
    self.status ||= "open"
  end

  def user_is_a_customer
    errors.add(:user, "should be a customer") unless self.user.is_a_customer?
  end
end
