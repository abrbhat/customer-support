require 'rails_helper'

RSpec.describe Admin, type: :model do
  before do
    @admin = create(:admin)
  end

  describe "when being destroyed" do
    it "should not get destroyed if last admin" do
      @admin.destroy

      expect(Admin.count).to eq 1
    end
  end
end
