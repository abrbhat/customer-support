class SupportRequestViewPage
  include Capybara::DSL

  def self.visit(id)
    Capybara::visit "#/support_request/view/#{id}"
  end
end
