class SupportRequestListPage
  include Capybara::DSL

  def visit
    Capybara::visit '#/support_request/list'
  end
end
