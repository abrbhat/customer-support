class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,:omniauthable,
          :confirmable

  include DeviseTokenAuth::Concerns::User

  belongs_to :role

  has_many :support_requests

  after_initialize :init
  before_save -> { skip_confirmation! }

  def is_a_customer?
    return self.role.name == "customer"
  end

  def is_an_agent?
    return self.role.name == "agent"
  end

  def is_admin?
    return self.role.name == "admin"
  end

  private

  def init
    self.role ||= Role.find_by_name('customer')
  end
end
