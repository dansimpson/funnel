require 'amqp'
require 'json'


class AMQPProxy < Funnel::WebSocket::Connection

  def on_data data
    handle_command parse(data)
  end

  def on_ready
    Logger.log("Pub")
  end

  def on_disconnect
    #unsubscribe
  end

  def handle_command hash
    hash['data']
    hash['command']
    hash['topic']
  end
  
end
