class SignupPersonalPage

# css selectors
FIRSTNAME_FIELD = {id: 'firstName'}
LASTNAME_FIELD = {id: 'lastName'}
EMAIL_FIELD = {id: 'email'}
GENDER_SELECT = {id: 'genderCode'}
GENDER_OPTION = {class: 'ui-select-choices-row-inner'}
BIRTHDAY_SELECT = {name: 'birthDay'}
BIRTHDAY_OPTION = {class: 'ui-select-choices-row-inner'}
BIRTHMONTH_SELECT = {name: 'birthMonth'}
BIRTHMONTH_OPTION = {class: 'ui-select-choices-row-inner'}
BIRTHYEAR_SELECT = {name: 'birthYear'}
BIRTHYEAR_OPTION = {class: 'ui-select-choices-row-inner'}

NEXT_LOCATION_BUTTON = {class: 'btn'}

SUCCESS_BANNER = {class: 'sub-title'}
EMAIL_ERROR_MSG = {id: 'emailError'}

attr_reader :driver

# class method

    def initialize(driver)
        @driver = driver
    end

    def enter_firstname(firstname)
        firstname_field = @driver.find_element(FIRSTNAME_FIELD)
        firstname_field.send_keys(firstname)
    end

    def enter_lastname(lastname)
        lastname_field = @driver.find_element(LASTNAME_FIELD)
        lastname_field.send_keys(lastname)
    end

    def enter_email(email)
        email_field = @driver.find_element(EMAIL_FIELD)
        email_field.send_keys(email)
    end

    def enter_gender(gender)
        gender_select_list = @driver.find_element(GENDER_SELECT)
        gender_select_list.click
        gender_options = @driver.find_elements(GENDER_OPTION)
        gender_options.each do |opt|
            if opt.text == gender
                opt.click
                break
            end
        end
    end

    def enter_birth_day(day)
        birthday_select_list = @driver.find_element(BIRTHDAY_SELECT)
        birthday_select_list.click
        birthday_options = @driver.find_elements(BIRTHDAY_OPTION)
        birthday_options.each do |opt|
            if opt.text == day
                opt.click
                break
            end
        end
    end

    def enter_birth_month(month)
        birthmonth_select_list = @driver.find_element(BIRTHMONTH_SELECT)
        birthmonth_select_list.click
        birthmonth_options = @driver.find_elements(BIRTHMONTH_OPTION)
        birthmonth_options.each do |opt|
            if opt.text == month
                opt.click
                break
            end
        end
    end

    def enter_birth_year(year)
        birthyear_select_list = @driver.find_element(BIRTHYEAR_SELECT)
        birthyear_select_list.click
        birthyear_options = @driver.find_elements(BIRTHYEAR_OPTION)
        birthyear_options.each do |opt|
            if opt.text == year
                opt.click
                break
            end
        end
    end

    def submit_form()
        signup_buttons = @driver.find_elements(NEXT_LOCATION_BUTTON)
        signup_buttons.each do |button|
            if button.text == "Next: Location chevron_right"
                puts "NEXT button found"
                puts "#{button.text}"
                button.click
                break
            else
                puts "NEXT button not found"
                puts "#{button.text}"
            end
        end
    end

    def get_banner_text()
        banner = @driver.find_element(SUCCESS_BANNER)
        banner.text
    end

    def get_email_field_error()
        error = @driver.find_element(EMAIL_ERROR_MSG)
        error.text
    end    
end