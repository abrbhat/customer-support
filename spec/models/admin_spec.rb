require 'rails_helper'

RSpec.describe Admin, type: :model do
  before do
    @admin = create(:admin)
  end

  describe "when subject is not present" do
    it "should not be valid" do
      @support_request.subject = " "
      expect(@support_request).not_to be_valid
    end
  end
end
