require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "user can visit writings" do
    user = create(:user)

    sign_in(user) # your login helper
    visit welcome_writings_url
    STDIN.gets
  end
end
