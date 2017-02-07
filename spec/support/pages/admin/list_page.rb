class AdminListPage
  include Capybara::DSL

  def self.visit
    Capybara::visit '#/admin/list'
  end
end
