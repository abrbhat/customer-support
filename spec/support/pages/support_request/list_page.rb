class SupportRequestListPage
  include Capybara::DSL

  def self.visit
    Capybara::visit '#/support_request/list'
  end
end
