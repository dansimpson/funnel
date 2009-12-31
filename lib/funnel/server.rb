module Funnel
  class Server
    
    def self.start host, port
      
      EM.epoll  if EM.epoll?
      EM.kqueue if EM.kqueue?
      
      EM.run do
        
        trap("TERM") { stop }
        trap("INT")  { stop }
 
        EM.start_server(host, port, Routing::Router)
        
      end
      
    end
    
    def self.stop
      EM.stop
    end
    
  end
end