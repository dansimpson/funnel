class EchoHandler < Funnel::WebSocket::Connection

  #called when the connection is ready to send
  #and receive data
  def on_ready
    puts "Ready..."
  end

    #called on disconnect
  def on_disconnect
    puts "Ended"
  end

    #right back at you
  def on_data msg
    send_message msg
  end

end