$:.unshift File.dirname(__FILE__)
FUNNEL_ROOT = File.expand_path("../../",  __FILE__)

require "rubygems"
require "funnel"

Funnel::Configuration.load("config/settings.yml")

#load handlers defined by user
handlers = Dir.entries(FUNNEL_ROOT + "/handlers").select { |n| not n =~ /^\.+$/ }
if handlers
  handlers.each do |h|
    require FUNNEL_ROOT + "/handlers/#{h}"
  end
end

require "routes"

#start the server
Funnel::Server.start(
  Funnel::Configuration.get(:host),
  Funnel::Configuration.get(:port)
)

Funnel::Log.debug!