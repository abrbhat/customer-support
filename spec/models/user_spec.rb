require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  describe "is_admin?" do
    it "should be true if user is an admin" do
      @user.type = "Admin"
      @user.save

      expect(@user.is_admin?).to be true
    end
    it "should be false if user is not an admin" do
      @user.type = "Agent"
      @user.save

      expect(@user.is_admin?).to be false
    end
  end

  describe "is_an_agent?" do
    it "should be true if user is an agent" do
      @user.type = "Agent"
      @user.save

      expect(@user.is_an_agent?).to be true
    end
    it "should be false if user is not an agent" do
      @user.type = "Customer"
      @user.save

      expect(@user.is_an_agent?).to be false
    end
  end

  describe "is_a_customer?" do
    it "should be true if user is an customer" do
      @user.type = "Customer"
      @user.save

      expect(@user.is_a_customer?).to be true
    end
    it "should be false if user is not a customer" do
      @user.type = "Agent"
      @user.save

      expect(@user.is_a_customer?).to be false
    end
  end
end
