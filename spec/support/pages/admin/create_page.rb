class AdminCreatePage
  include Capybara::DSL

  def self.visit
    Capybara::visit "#/admin/create"
  end
end
