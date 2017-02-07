class LoginPage
  include Capybara::DSL

  def visit
    Capybara::visit '#/user/login'
  end

  def sign_in(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    find("button", text: "Sign in").click
  end

  def self.complete_login(email, password)
    Capybara::visit '#/user/login'

    Capybara::fill_in "Email", with: email
    Capybara::fill_in "Password", with: password
    Capybara::find("button", text: "Sign in").click
  end
end
