module Funnel
  module Routing
  
    class Router < WebSocket::Connection
  
      # parse headers, validate headers, accept
      # connection, and change the default handler
      def receive_data data
        if Log.is_debug?
          Log.debug("----------- FRAME -------------")
          Log.debug(data)
          Log.debug("-------------------------------")
        end

        if is_flash_policy_request?(data)
          send_data Funnel::Flash::Policy.response
          close_connection and return
        end

        @headers = WebSocket::Headers.parse(data)

        unless valid_connection?
          Log.info("Invalid WebSocket Connection")
          close_connection and return
        end

        unless valid_origin?
          Log.info("Invalid WebSocket Origin")
          close_connection and return
        end

        accept_connection
        defer_connection

      end

      # is this a websocket connection?
      def valid_connection?
        @headers[:connection] =~ /upgrade/i && @headers[:upgrade] =~ /websocket/i
      end

      # we can limit the availability to this service
      # by setting the accepted_origins configuration
      def valid_origin?
        accepted = Funnel::Configuration.get(:accepted_origins)
        accepted.empty? or accepted.include?(@headers[:origin])
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
        handler = Routes.get_handler(path)

        unless handler
          Log.info "No route matches #{path}"
          close_connection and return
        end

        conn = handler.send(:new, @signature)
        conn.headers = @headers

        EM.instance_variable_get("@conns")[@signature] = conn
      end

      def requested_protocol
        @header[:websocket_protocol] || :default
      end

      # since we expect some client to be connecting
      # via a flash socket, we need to handle the policy
      # request if we detect '<' char
      def is_flash_policy_request? data
        data[0] == ?<
      end

    end
  end
end