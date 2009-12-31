$:.unshift File.dirname(__FILE__)
FUNNEL_ROOT = File.expand_path('../../',  __FILE__)

require 'rubygems'
require 'funnel'

#local includes
require 'config'
require 'funnel'

#load servers defined by user
handlers = Dir.entries(FUNNEL_ROOT + "/handlers").select { |n| not n =~ /^\.+$/ }
if handlers
  handlers.each do |h|
    puts h
    require FUNNEL_ROOT + "/handlers/#{h}"
  end
end

#require routes and map them
require 'routes'

#start the server
Funnel::Server.start(Configuration.get(:host), Configuration.get(:port))