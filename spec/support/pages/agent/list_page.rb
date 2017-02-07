class AgentListPage
  include Capybara::DSL

  def self.visit
    Capybara::visit '#/agent/list'
  end
end
