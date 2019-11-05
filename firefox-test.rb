require "selenium-webdriver"
require "rspec"
require_relative "signup_personal_page.rb"
require_relative "signup_address_page.rb"
require_relative "signup_devices_page.rb"

wait = Selenium::WebDriver::Wait
timestamp = Time.now.to_i
# Step 1
firstname = "Dat"
lastname = "Le"
email = "user#{timestamp}@test.com"
gender = "Male"
day = "24"
month = "October"
year = "1983"
invalidemail = "datle"
expected_signup_address_page_text = "Add your address"

# Step 2
city = "Ho Chi Minh"
zip = "700000"
expected_signup_devices_page_text = "Tell us about your devices"

# TEST: sign up for utest
describe "Signing up a new user" do
  
  describe "Step 1: Tell us about yourself"	do
  	 it "- Input personal information - All fields except Languages are required" do
		    # Go to signup form
        @driver = Selenium::WebDriver.for :remote, desired_capabilities: :firefox
        @driver.navigate.to "https://www.utest.com/signup/personal"
        wait.new(:timeout => 10)
		    # Fill out and submit form
        signup_personal = SignupPersonalPage.new(@driver)
        signup_personal.enter_firstname(firstname)
        signup_personal.enter_lastname(lastname)
        signup_personal.enter_email(email)
        signup_personal.enter_birth_month(month)
        signup_personal.enter_birth_day(day)
        signup_personal.enter_birth_year(year)
        signup_personal.enter_gender(gender)
        signup_personal.submit_form()
        wait.new(:timeout => 10)

        # Confirm successfully and go to the next page
        signup_location = SignupAddressPage.new(@driver)
        banner_text = signup_location.get_banner_text()
        expect(banner_text).to eq(expected_signup_address_page_text)

        # Fill out and submit form
        signup_location.enter_city(city)
        signup_location.enter_zip_code(zip)
        signup_location.submit_to_next_page()
        wait.new(:timeout => 10)

        # Confirm successfully and go to the next page
        signup_devices = SignupDevicesPage.new(@driver)
        banner_text = signup_devices.get_banner_text()
        expect(banner_text).to eq(expected_signup_devices_page_text)

		    @driver.quit
	   end
  end
end

# #TEST: sign up for utest with invalid email
# describe "Signup - Tell us about yourself - invalid email" do
#   describe "- when signing up a new user"	do
#   	 it "Invalid email error occurs" do
# 		    # Go to signup form
#         @driver = Selenium::WebDriver.for :remote, desired_capabilities: :firefox
#         @driver.navigate.to "https://www.utest.com/signup/personal"
# 		    # Fill out and submit form
#         signup = SignupPersonalPage.new(@driver)
#         signup.enter_firstname(firstname)
#         signup.enter_lastname(lastname)
#         signup.enter_email(invalidemail)
        
#         # Show invalid email error
#         signup.get_email_field_error()
# 		    @driver.quit
# 	   end
#   end
# end
