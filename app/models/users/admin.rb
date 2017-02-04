class Admin < User
  after_initialize :init

  private

  def init
    self.type ||= "admin"
  end
end
