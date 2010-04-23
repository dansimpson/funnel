require 'rubygems'
require 'eventmachine'

module Funnel
  module WebSocket
  end
end

require 'funnel/configuration.rb'
require 'funnel/log.rb'
require 'funnel/flash/policy.rb'
require 'funnel/generators/application.rb'
require 'funnel/web_socket/frame.rb'
require 'funnel/web_socket/headers.rb'
require 'funnel/web_socket/connection.rb'
require 'funnel/routing/route.rb'
require 'funnel/routing/routes.rb'
require 'funnel/routing/router.rb'
require 'funnel/server.rb'