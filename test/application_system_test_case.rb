require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include FactoryBot::Syntax::Methods

  driven_by :selenium, using: :headless_chrome
  # driven_by :selenium, using: :chrome, screen_size: [1400, 900]

  def sign_in(user)
    visit new_user_session_path

    fill_in "user_email", with: user.email
    fill_in "user_password", with: "Banana#13"

    click_button "commit"
    # page.save_screenshot("login.png")
  end
end
