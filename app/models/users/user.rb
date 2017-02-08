# This is the parent class for Admin, Agent and User classes
# This class handles registration and authentication for the sub-classes

class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,:omniauthable,
          :confirmable

  validates :email,
            :presence => true,
            :uniqueness => true

  include DeviseTokenAuth::Concerns::User

  before_validation :downcase_email
  before_save :set_default_type

  before_save -> { skip_confirmation! }

  # Checks if the user is a customer
  def is_a_customer?
    return self.type == "Customer"
  end

  # Checks if the user is an agent
  def is_an_agent?
    return self.type == "Agent"
  end

  # Checks if the user is admin
  def is_admin?
    return self.type == "Admin"
  end

  private

  def set_default_type
    self.type ||= "Customer"
  end

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
