require 'rails_helper'

RSpec.describe SupportRequest, type: :model do
  before do
    @support_request = SupportRequest.new(subject: "Unable to understand")
  end

  describe "when subject is not present" do
    it "should not be valid" do
      @support_request.subject = " "
      expect(@support_request).not_to be_valid
    end
  end
end
