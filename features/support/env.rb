require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "os"

require_relative "helpers"

World(Helpers) #todos os recursos do módulo helpers são nativos dentro da execução do cucumber,
# dessa forma get_token é método nativo e vai ser executado de qq lugar basta acessar step definition e substituir a variável token.
# para get_token

#variável de ambiente global
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml"))
#vai carregar as configurações de ambiente de acordo com informado em cucumber.yaml, da opção padrão que foi informado.
# CONFIG em caixa alta faz dela uma variável global sendo acessada de qq lugar do projeto.

case ENV["BROWSER"] # ENV - para obter uma variável de ambiente
when "firefox"
  @driver = :selenium
when "chrome"
  @driver = :selenium_chrome
when "headless"
  Capybara.register_driver :selenium_chrome_headless do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
      options.add_argument "--headless"
      options.add_argument "--disable-gpu"
      options.add_argument "--no-sandbox"
      options.add_argument "--disable-site-isolation-trials"
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
  @driver = :selenium_chrome_headless
else
  puts "invalid Browser"
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG["url"] #já tem a url que é o cucumber.yaml
  config.default_max_wait_time = 13
end
