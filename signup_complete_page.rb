class SignupCompletePage
    # css selectors
    SUBMIT_BUTTON = {id: 'laddaBtn'}
    SUCCESS_BANNER = {class: 'sub-title'}
    PASSWORD_FIELD = {name: 'password'}
    CONFIRM_PASSWORD_FIELD = {name: 'confirmPassword'}

    attr_reader :driver
    
    # class methods
    def initialize(driver)
        @driver = driver
    end

    def enter_password(password)
        password_field = @driver.find_element(PASSWORD_FIELD)
        password_field.send_keys(password)
    end

    def enter_confirm_password(password)
        confirm_pwd_field = @driver.find_element(CONFIRM_PASSWORD_FIELD)
        confirm_pwd_field.send_keys(password)
    end    

    def submit_to_complete()
        submit_button = @driver.find_element(SUBMIT_BUTTON)
        submit_button.click
    end

    def get_banner_text()
        banner = @driver.find_element(SUCCESS_BANNER)
        banner.text
    end

end