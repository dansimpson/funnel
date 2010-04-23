#funnel - a realtime resource-centric application framework

##Installation

	gem install funnel -s http://gemcutter.org

##Creating a project

	funnel example
	cd example
	ruby script/server


##Project Hierarchy

	/config
		boot.rb
		routes.rb (define your handler routes)
		settings.yml (host, port, accepted sources, etc)
	/handlers -> your real time resource handlers
		game_handler.rb
		chat_handler.rb
	/script
		server
	/htdocs
		test.html -> a simple page to test that your server is running


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

	map.connect "/echo" => EchoHandler

##Dependencies
- eventmachine http://github.com/eventmachine/eventmachine

##Coming soon
- Plugins for various real time things (amqp, xmpp, twitter, etc)
- Client side libraries to enable cross browser development
- Client side plugins