#funnel - a realtime resource-centric application framework

##Installation

	gem install funnel -s http://gemcutter.org

##Creating a project

	funnel myapp

##Project Hierarchy

/project
	/config
		boot.rb
		routes.rb
		config.rb
	/handlers -> your real time resource handlers
		time.rb 
		game.rb
		xmpp.rb
		amqp.rb
	/script
		server
	

## your first "handler"

echo_handler.rb

	class EchoHandler < Funnel::WebSocket::Connection

	  #called when the connection is ready to send
	  #and receive data
	  def on_ready
	  end

      #called on disconnect
	  def on_disconnect
	  end

      #right back at you
	  def on_data msg
	    send_message msg
	  end

	end

set up the route in config/routes.rb

	map.default :handler => Funnel::Servers::DummyServer

##Dependencies
- eventmachine http://github.com/eventmachine/eventmachine


# tired... more info coming soon