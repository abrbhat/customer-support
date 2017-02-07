class SupportRequestCreatePage
  include Capybara::DSL

  def self.visit(id)
    Capybara::visit "#/support_request/create"
  end
end
