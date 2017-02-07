class CustomerViewPage
  include Capybara::DSL

  def self.visit(id)
    Capybara::visit "#/customer/view/#{id}"
  end
end
