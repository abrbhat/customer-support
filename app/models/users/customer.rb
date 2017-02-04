class Customer < User
  after_initialize :init

  private

  def init
    self.type ||= "customer"
  end
end
