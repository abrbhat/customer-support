class Agent < User
  after_initialize :init

  has_many :support_requests

  private

  def init
    self.type ||= "agent"
  end
end
