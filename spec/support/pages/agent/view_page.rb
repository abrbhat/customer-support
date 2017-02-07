class AgentViewPage
  include Capybara::DSL

  def self.visit(id)
    Capybara::visit "#/agent/view/#{id}"
  end
end
