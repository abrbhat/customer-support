class AdminViewPage
  include Capybara::DSL

  def self.visit(id)
    Capybara::visit "#/admin/view/#{id}"
  end
end
