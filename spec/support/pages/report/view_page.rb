class ReportViewPage
  include Capybara::DSL

  def self.visit
    Capybara::visit "#/report/view"
  end
end
