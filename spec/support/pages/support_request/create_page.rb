class SupportRequestCreatePage
  include Capybara::DSL

  def self.visit
    Capybara::visit "#/support_request/create"
  end
end
