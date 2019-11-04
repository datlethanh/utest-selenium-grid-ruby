# Overview
This repository is the home for automation test guideline and source codes for the "Sign Up For Free" link from the website www.utest.com. This test is being used Selenium API and RUBY language.

# Assumption
- The automation test is run on the Selenium Grid setup on the Windows 10 x86_64 OS platform.
- The test is executed on the Firefox web browser with latest version 70.0.1 (64-bit) only.

# Install Ruby on Windows
- Downloads the latest version of RubyInstaller with DEVKIT from the link https://rubyinstaller.org/downloads. The current latest version is Ruby+Devkit 2.6.5-1 (x64).
- Install the rubyinstaller-devkit-2.6.5-1-x64.exe file.
- Check the Ruby version installed by this command: ruby -v. The current version of Ruby used for the test is 2.6.5p114

# Install Selenium WebDriver
- Go to the www.seleniumhq.org website to download the latest version of Selenium Client & WebDriver binding with Ruby language.
- Define the selenium-webdriver and rspec version in the Gemfile as below
    source 'https://rubygems.org'
        gem 'selenium-webdriver', '~> 3.142', '>= 3.142.6'
        gem 'rspec', '~> 3.9'

# Install Bundle
- From command-line window install the bundle tool by this command: gem install bundler.
- Go to project directory then type the command: bundle install.

# Install geckodriver
- Go to the https://github.com/mozilla/geckodriver/releases to get the latest version of Firefox webdriver.
- Set PATH point to that above driver in our system via Environment Variables.

# Setting up the HUB for Selenium GRID
- Install the latest java.
- Go to the www.seleniumhq.org website to download the Selenium Standalone Server.
- Start the Selenium GRID HUB by this command: "java -jar selenium-server-standalone-3.141.59.jar -role hub" from the command-line window

# Configuring NODES
- Start and register a NODE by entering this command: "java -jar selenium-server-standalone-3.141.59.jar -role node -hub http://localhost:4444/grid/register"

# Runnings tests
- Go to the project directory then enter this command "rspec firefox-test.rb" from a terminal window to run the test.
