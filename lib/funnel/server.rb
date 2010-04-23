module Funnel
  class Server

    def self.start host, port

      raise "Reactor already running" if EM.reactor_running?

      EM.epoll  if EM.epoll?
      EM.kqueue if EM.kqueue?

      Log.info "Starting Funnel Server..."

      EM.run do

        trap("TERM") { stop }
        trap("INT")  { stop }

        EM.start_server(host, port, Routing::Router)

        Log.info "Server Listening on #{host}:#{port}"
      end
    end

    def self.stop
      Log.info "Funnel Server Shutting Down"
      EM.stop
    end

  end
end