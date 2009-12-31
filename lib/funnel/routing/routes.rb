module Funnel
  module Routing
    
    class Routes

      @@instance = nil

      def self.get_handler path
        @@instance.get_handler(path)
      end
      
      def self.draw
        @@instance = Routes.new unless @@instance
        yield @@instance
      end
      
      
      def initialize
        @routes = {}
      end
      
      def connect path, opts
        @routes[path] = Route.new(path, opts)
      end
      
      def default opts
        @routes[:default] = Route.new(:default, opts)
      end
      
      def get_default
        @routes.key?(:default) ? @routes[:default].handler : Funnel::Servers::DummyServer
      end
      
      def get_handler path
        @routes.key?(path) ? @routes[path].handler : @routes[:default].handler
      end
      
    end
  end
end