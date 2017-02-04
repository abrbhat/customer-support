class SupportRequest < ApplicationRecord
  belongs_to :customer
  belongs_to :agent

  validates :customer, presence: true
  validates :agent, presence: true
  validates :subject, presence: true

  after_initialize :init

  private

  def init
    self.status ||= "open"
  end
end
