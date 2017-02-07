class AgentCreatePage
  include Capybara::DSL

  def self.visit
    Capybara::visit "#/agent/create"
  end
end
