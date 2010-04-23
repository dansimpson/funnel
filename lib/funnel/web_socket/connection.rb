module Funnel
  module WebSocket

    class Connection < EM::Connection

      attr_accessor :headers

      ###
      # helper methods
      ###

  		def cookies
  			@headers[:cookies]
  		end

      def host
        @headers[:host]
      end

      def origin
        @headers[:origin]
      end

      def path
        @headers[:path]
      end

      def protocol
        @headers[:websocket_protocol]
      end

      #override this
      def on_ready
      end

      #override this
      def on_disconnect
      end

      #override this
      def on_data data
      end

      #called from EM
      def unbind
        on_disconnect
      end

      #called from EM
      def post_init
        @headers = {}
        on_ready
      end

      #called from EM
      def receive_data data
        while msg = data.slice!(/\000([^\377]*)\377/)
          on_data Frame.decode(msg)
        end
      end

      def send_message msg
        send_data Frame.encode(msg)
      end

    end
  end
end