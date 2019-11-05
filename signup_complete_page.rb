class SignupCompletePage
    # css selectors
    SUBMIT_BUTTON = {class: 'btn'}
    SUCCESS_BANNER = {class: 'sub-title'}

    attr_reader :driver
    
    # class methods
    def initialize(driver)
        @driver = driver
    end

    def submit_to_complete()
        submit_buttons = @driver.find_elements(NEXT_BUTTON)
        submit_buttons.each do |button|
            if button.text == "Complete Setup chevron_right"
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