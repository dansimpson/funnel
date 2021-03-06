$:.unshift File.dirname(__FILE__)
FUNNEL_ROOT = File.expand_path("../../",  __FILE__)

require "rubygems"
require "funnel"

Funnel::Configuration.load("config/settings.yml")

#load handlers defined by user
handlers = Dir["handlers/**/*"].select { |n| n =~ /^.*\.rb$/ }
if handlers
  handlers.each do |h|
    require FUNNEL_ROOT + "/#{h}"
  end
end

require "routes"

#start the server
Funnel::Server.start(
  Funnel::Configuration.get(:host),
  Funnel::Configuration.get(:port)
)

Funnel::Log.debug!