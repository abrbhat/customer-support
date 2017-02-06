RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  
  config.include Warden::Test::Helpers

  config.after :each do
    Warden.test_reset!
  end
end
