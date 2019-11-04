require "selenium-webdriver"
require "rspec"
require_relative "signup_personal_page.rb"
require_relative "signup_address_page.rb"

timestamp = Time.now.to_i
firstname = "Dat"
lastname = "Le"
email = "user#{timestamp}@test.com"
gender = "Male"
day = "24"
month = "October"
year = "1983"

invalidemail = "datle"
expected_signup_address_page_text = "Add your address"

# TEST: sign up for utest
describe "Tell us about yourself" do
  describe "- When signing up a new user"	do
  	 it "- Input personal information" do
		    # Go to signup form
        @driver = Selenium::WebDriver.for :remote, desired_capabilities: :firefox
        @driver.navigate.to "https://www.utest.com/signup/personal"
		    # Fill out and submit form
        signup_personal = SignupPersonalPage.new(@driver)
        signup_personal.enter_firstname(firstname)
        signup_personal.enter_lastname(lastname)
        signup_personal.enter_email(email)
        signup_personal.enter_gender(gender)
        signup_personal.enter_birth_month(month)
        signup_personal.enter_birth_day(day)
        signup_personal.enter_birth_year(year)
        signup_personal.submit_form()

        # Confirm successfully and go to the next page
        signup_location = SignupAddressPage.new(@driver)
        banner_text = signup_location.get_banner_text()
        expect(banner_text).to eq(expected_signup_address_page_text)
		    @driver.quit
	   end
  end
end

#TEST: sign up for utest with invalid email
describe "Signup - Tell us about yourself - invalid email" do
  describe "- when signing up a new user"	do
  	 it "Invalid email error occurs" do
		    # Go to signup form
        @driver = Selenium::WebDriver.for :remote, desired_capabilities: :firefox
        @driver.navigate.to "https://www.utest.com/signup/personal"
		    # Fill out and submit form
        signup = SignupPersonalPage.new(@driver)
        signup.enter_firstname(firstname)
        signup.enter_lastname(lastname)
        signup.enter_email(invalidemail)
        
        # Show invalid email error
        signup.get_email_field_error()
		    @driver.quit
	   end
  end
end
