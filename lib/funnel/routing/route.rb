module Funnel
  module Routing
    
    class Route
      

      def initialize path, opts
        @opts = opts || {}
        @opts[:path] = path
      end
      
      def handler
        @opts[:handler]
      end
      
      
    end
  end
end