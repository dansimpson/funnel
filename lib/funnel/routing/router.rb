module Funnel
  module Routing
    
    class Router < WebSocket::Connection

      # parse headers, validate headers, accept
      # connection, and change the default handler
      def receive_data data

        @headers = WebSocket::Headers.parse(data)

        if valid_connection? && valid_route?
          accept_connection
          defer_connection
        else
          close_connection
        end

      end

      # is this a websocket connection?
      def valid_connection?
        @headers[:connection] =~ /upgrade/i && @headers[:upgrade] =~ /websocket/i
      end

      # TODO: add WebSocket-Protocol
      def accept_connection
        response = "HTTP/1.1 101 Web Socket Protocol Handshake\r\n"
        response << "Upgrade: WebSocket\r\n"
        response << "Connection: Upgrade\r\n"
        response << "WebSocket-Origin: #{origin}\r\n"
        response << "WebSocket-Location: ws://#{host}#{path}\r\n\r\n"

        send_data response
      end

      # change the handler from this instance, to a new instance
      # of the type defined by the routing map
      def defer_connection
        
        conn = Routes.get_handler(path).send(:new, @signature)
        conn.headers = @headers
        
        EM.instance_variable_get("@conns")[@signature] = conn
      end

      def valid_route?
        true
      end

      def requested_protocol
        @header[:websocket_protocol] || :default
      end
      
    end
  end
end