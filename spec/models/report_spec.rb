require 'rails_helper'

RSpec.describe Report, type: :model do
  before do
    @support_requests = create_list(
      :support_request,
      5,
      status: 'closed'
    )
  end

  describe "generate" do
    it "should generate report" do
      @pdf = Report.generate

      expect(@pdf).to be_present
    end
  end
end
