rails test:system
rails test test/system/users_test.rb
# take screen shot
page.save_screenshot("login.png")
# pause test
STDIN.gets
sleep 5