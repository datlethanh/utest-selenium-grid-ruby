class SignupAddressPage
    # css selectors
    SUCCESS_BANNER = {class: 'sub-title'}

    attr_reader :driver
    
    # class methods
    def initialize(driver)
        @driver = driver
    end

    def get_banner_text()
        banner = @driver.find_element(SUCCESS_BANNER)
        banner.text
    end

end