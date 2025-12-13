require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "user can visit writings" do
    user = create(:user)

    sign_in(user) # your login helper
    assert_text "user1@example.com"
    # STDIN.gets
  end
end
