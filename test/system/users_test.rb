require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "user can sign in" do
    user = create(:user)

    sign_in(user) # your login helper
    assert_text "Sign Out"
    # STDIN.gets
  end

  test "user can sign up" do
    visit new_user_registration_path

    fill_in "user_email", with: "newuser@example.com"
    fill_in "user_password", with: "Banana#13"
    fill_in "user_password_confirmation", with: "Banana#13"

    click_button "commit"

    assert_text "Sign Out"
  end

  test "user can request password reset" do
    # Create a user with FactoryBot
    user = create(:user, email: "testuser@example.com", password: "Banana#13")
    visit new_user_password_path

    fill_in "user_email", with: user.email

    click_button "commit"
    assert_text "You will receive an email with instructions on how to reset your password in a few minutes."
    assert_current_path new_user_session_path
  end
end
