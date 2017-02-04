class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,:omniauthable,
          :confirmable

  include DeviseTokenAuth::Concerns::User

  has_many :support_requests

  before_save -> { skip_confirmation! }

  def is_a_customer?
    return self.type == "Customer"
  end

  def is_an_agent?
    return self.type == "Agent"
  end

  def is_admin?
    return self.type == "Admin"
  end
end