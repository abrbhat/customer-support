RSpec.configure do |config|
  Capybara.javascript_driver = :selenium
  Capybara.default_wait_time = 5
end
