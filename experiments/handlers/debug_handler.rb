module Funnel

  class DebugHandler < Funnel::WebSocket::Connection

    #called when the connection is ready to send
    #and receive data
    def on_ready
      Log.info "A connection has been established"
    end

    #called on disconnect
    def on_disconnect
      Log.info "A connection has been closed"
    end

    #right back at you
    def on_data msg
      Log.info "A message was received #{msg}"
      send_message msg
      Log.info "A message was sent #{msg}"
    end

  end

end