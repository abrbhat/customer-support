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
  before_save :set_or_unset_closed_at
  after_save :assign_or_deassign_agent

  def self.generate_report
    @support_requests = SupportRequest.where(status: 'closed')
                                      .where('closed_at >= ?', 1.month.ago)
                                      .sort


    html = "<!doctype html><html>" +
            "<head><meta charset='utf-8'></head>" +
           "<body>" +
           "#{support_request_table}" +
           "/body></html>"

    @pdf = PDFKit.new(html).to_file("report.pdf")
  end

  private

  def init
    self.status ||= "open"
    self.severity ||= "low"
  end

  def set_or_unset_closed_at
    if self.status_changed? and
      if self.status == "closed"
        self.closed_at = Time.now
      else
        self.closed_at = nil
      end
    end
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
