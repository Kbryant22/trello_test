unless ENV['TRELLO_ENV']
  raise 'You must set the TRELLO_ENV environment variable to run tests.  See README.md for more info.'
end

puts "Executing in Trello '#{ENV['TRELLO_ENV'].upcase}' environment."

require File.expand_path(ENV['TRELLO_ENV']+'.rb', File.dirname(__FILE__))
#require File.expand_path('./trello_env_common_settings.rb', File.dirname(__FILE__))

Capybara.configure do |config|
  config.app_host   = $TRELLO_SECURE_BASE_URL	
  config.run_server = false
end

puts "Portal URL: #{Capybara.app_host}"
