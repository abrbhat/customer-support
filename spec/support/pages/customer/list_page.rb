class CustomerListPage
  include Capybara::DSL

  def self.visit
    Capybara::visit '#/customer/list'
  end
end
