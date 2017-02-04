class Agent < User
  after_initialize :init

  private

  def init
    self.type ||= "agent"
  end
end
