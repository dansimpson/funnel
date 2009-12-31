

class ChatServer < Funnel::WebSocket::Connection

  @@chatroom = EM::Channel.new

  def post_init
		@sid = @@chatroom.subscribe do |msg|
			send_message msg
		end
  end

  def on_disconnect
    "Chatter disconnected"
    @@chatroom.unsubscribe(@sid)
  end

  def on_data msg
    @@chatroom.push(msg)
  end


end

