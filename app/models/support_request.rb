class SupportRequest < ApplicationRecord
  validates :subject, presence: true

  after_initialize :init

  def init
    self.status ||= "open"
  end
end
