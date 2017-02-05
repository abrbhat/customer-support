class SupportRequest < ApplicationRecord
  belongs_to :customer
  belongs_to :agent

  @@status_list = %w{open closed resolved}
  @@severity_list = %w{low medium high}

  validates :customer, presence: true
  validates :agent, presence: true
  validates :subject, presence: true
  validates :status,
            :presence => true,
            :inclusion => {
              :in => @@status_list,
              :message => "%{value} is not a valid status"
            }
  validates :severity,
            :presence => true,
            :inclusion => {
              :in => @@severity_list,
              :message => "%{value} is not a valid severity"
            }

  after_initialize :init

  private

  def init
    self.status ||= "open"
    self.severity ||= "low"
  end
end
