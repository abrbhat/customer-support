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
end
