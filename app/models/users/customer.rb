# This class represents a support request customer

class Customer < User
  after_initialize :init

  has_many :support_requests

  private

  def init
    self.type ||= "customer"
  end
end
