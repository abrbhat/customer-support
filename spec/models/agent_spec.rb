require 'rails_helper'

RSpec.describe Agent, type: :model do
  before do
    @agent = create(:agent)
  end

  describe "when being destroyed" do
    it "should assign support requests to other agents before being destroyed" do
      @agent2 =  create(:agent)
      @support_request = create(
        :support_request,
        agent: @agent
      )

      expect(@agent.support_requests.count).to eq 1
      expect(@agent2.support_requests.count).to eq 0

      @agent.destroy

      expect(Agent.count).to eq 1
      expect(@agent2.support_requests.count).to eq 1
    end

    it "should not get destroyed if last agent and has support requests" do
      @support_request = create(
        :support_request,
        agent: @agent
      )

      @agent.destroy

      expect(Agent.count).to eq 1
    end
  end
end
