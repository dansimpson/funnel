module Funnel
  module Servers
    class DummyServer < Funnel::WebSocket::Connection
      
      def on_ready
        Logger.info("DummyServer - on_ready")
      end
      
      def on_data data
        Logger.info("DummyServer - on_data")
      end
      
      def on_disconnect
        Logger.info("DummyServer - on_disconnect")
      end
       
    end
  end
end

