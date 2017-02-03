require 'rails_helper'

RSpec.describe SupportRequest, type: :model do
  before do
    @support_request = SupportRequest.new(subject: "Unable to understand")
  end

  subject { @support_request }

  describe "when subject is not present" do
    before { @support_request.subject = " " }
    it { should_not be_valid }
  end
end
