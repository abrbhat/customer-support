RSpec.configure do |config|
  config.before(:suite, type: :feature) do
    FileUtils.rm_rf(Rails.root.join("public"))
    system("grunt build --gruntfile #{Rails.configuration.gruntfile_location}")
  end

  config.after(:suite, type: :feature) do
    FileUtils.rm_rf(Rails.root.join("public"))
  end
end
