class SignupAddressPage
    # css selectors
    CITY_FIELD = {id: 'city'}
    ZIP_FIELD = {id: 'zip'}
    NEXT_BUTTON = {class: 'btn'}
    SUCCESS_BANNER = {class: 'sub-title'}

    attr_reader :driver
    
    # class methods
    def initialize(driver)
        @driver = driver
    end

    def enter_city(city)
        city_field = @driver.find_element(CITY_FIELD)
        city_field.send_keys(city)
        city_field.click
        wait = Selenium::WebDriver::Wait.new(timeout: 10)
        city_field.click
        city_field.send_keys :arrow_down
        #city_field.click
    end

    def enter_zip_code(zip)
        zip_field = @driver.find_element(ZIP_FIELD)
        zip_field.click
        zip_field.send_keys(zip)
    end

    def submit_to_next_page()
        submit_buttons = @driver.find_elements(NEXT_BUTTON)
        submit_buttons.each do |button|
            if button.text == "Next: Devices chevron_right"
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

end