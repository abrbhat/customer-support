class SupportRequest < ApplicationRecord
  belongs_to :customer
  belongs_to :agent

  @@status_list = %w{open closed}
  @@severity_list = %w{low medium high}

  validates :customer, presence: true
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
  after_save :assign_or_deassign_agent

  private

  def init
    self.status ||= "open"
    self.severity ||= "low"
  end

  def assign_or_deassign_agent
    if self.status == "open" and
       self.agent.blank?
      self.agent = Agent.all
                        .sort_by{|agent| agent.support_requests.count}
                        .first
      self.save
    elsif self.status == "closed" and
          self.agent.present?
      self.agent_id = nil
      self.save
    end
  end
end
