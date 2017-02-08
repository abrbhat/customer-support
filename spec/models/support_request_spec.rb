require 'rails_helper'

RSpec.describe SupportRequest, type: :model do
  before do
    @support_request = create(:support_request)
  end

  describe "when subject is not present" do
    it "should not be valid" do
      @support_request.subject = " "
      expect(@support_request).not_to be_valid
    end
  end

  describe "when status is not present" do
    it "should not be valid" do
      @support_request.status = ""
      expect(@support_request).not_to be_valid
    end
  end

  describe "when category is not present" do
    it "should not be valid" do
      @support_request.category = ""
      expect(@support_request).not_to be_valid
    end
  end

  describe "when severity is not present" do
    it "should not be valid" do
      @support_request.severity = ""
      expect(@support_request).not_to be_valid
    end
  end

  describe "when closed" do
    it "should set closed at" do
      @support_request = create(:support_request, status: "open")

      @support_request.status = "closed"
      @support_request.save

      expect(@support_request.closed_at).to be_present
    end
  end

  describe "when reopened" do
    before do
      @agent = create(:agent)
      @support_request = create(:support_request, status: "closed")

      @support_request.status = "open"
      @support_request.save
    end
    it "should unset closed at" do
      expect(@support_request.closed_at).not_to be_present
    end
    it "should assign agent" do
      expect(@support_request.agent).to be_present
    end
  end
end
