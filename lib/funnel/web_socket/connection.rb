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
        puts "Connect"
      end
      
      #override this
      def on_disconnect
        puts "Disconnect"
      end
      
      #override this
      def on_data data
        puts "Data"
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
        on_data Frame.decode(data)
      end

      def send_message msg
        send_data Frame.encode(msg)
      end
      
    end
  end
end