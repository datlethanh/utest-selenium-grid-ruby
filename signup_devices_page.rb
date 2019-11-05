class SignupDevicesPage
    # css selectors
    SUCCESS_BANNER = {class: 'sub-title'}
    OS_SELECT = {name: 'osId'}
    OS_OPTION = {class: 'ui-select-match-text'}
    OSVERSION_SELECT = {name: 'osVersionId'}
    OSVERSION_OPTION = {class: 'ui-select-match-text'}
    OSLANGUAGE_SELECT = {name: 'osLanguageId'}
    OSLANGUAGE_OPTION = {class: 'ui-select-placeholder'}
    HANDSET_SELECT = {name: 'handsetMarkerId'}
    HANDSET_OPTION = {class: 'ui-select-match-text'} 
    HANDSET_MODEL_SELECT = {name: 'handsetModelId'}
    HANDSET_MODEL_OPTION = {class: 'ui-select-match-text'}
    HANDSET_OS_SELECT = {name: 'handsetOSId'}
    HANDSET_OS_OPTION = {class: 'ui-select-match'}  
    NEXT_BUTTON = {class: 'btn'}

    attr_reader :driver
    
    # class methods
    def initialize(driver)
        @driver = driver
    end

    def select_computer_os(os)
        computer_os_select_list = @driver.find_element(OS_SELECT)
        computer_os_select_list.click
        computer_os_options = @driver.find_elements(OS_OPTION)
        computer_os_options.each do |opt|
            if opt.text == os
                opt.click
                break
            end
        end
    end

    def select_computer_os_version(os_version)
        os_version = @driver.find_element(OSVERSION_SELECT)
        os_version.send_keys(os_version)
        os_version.click
        wait = Selenium::WebDriver::Wait.new(timeout: 10)
        os_version.send_keys :arrow_down
    end

    def select_computer_os_language(os_language)
        computer_os_language_select_list = @driver.find_element(OSLANGUAGE_SELECT)
        computer_os_language_select_list.click
        computer_os_language_options = @driver.find_elements(OSLANGUAGE_OPTION)
        computer_os_language_options.each do |opt|
            if opt.text == os_language
                opt.click
                break
            end
        end
    end

    def select_handset(handset_id)
        handset_select_list = @driver.find_element(HANDSET_SELECT)
        handset_select_list.click
        handset_options = @driver.find_elements(HANDSET_OPTION)
        handset_options.each do |opt|
            if opt.text == handset_id
                opt.click
                break
            end
        end
    end

    def select_handset_model(handset_model)
        handset_model_select_list = @driver.find_element(HANDSET_MODEL_SELECT)
        handset_model_select_list.click
        handset_model_options = @driver.find_elements(HANDSET_MODEL_OPTION)
        handset_model_options.each do |opt|
            if opt.text == handset_model
                opt.click
                break
            end
        end
    end

    def select_handset_os(handset_os)
        handset_os_select_list = @driver.find_element(HANDSET_OS_SELECT)
        handset_os_select_list.click
        handset_os_options = @driver.find_elements(HANDSET_OS_OPTION)
        handset_os_options.each do |opt|
            if opt.text == handset_os
                opt.click
                break
            end
        end
    end

    def submit_to_next_page()
        submit_buttons = @driver.find_elements(NEXT_BUTTON)
        submit_buttons.each do |button|
            if button.text == "Next: Last Step chevron_right"
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