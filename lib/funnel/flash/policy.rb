module Funnel
  module Flash
    class Policy

      def self.response
        settings = Funnel::Configuration
        accepted = settings.get(:accepted_origins)

        response = "<?xml version=\"1.0\"?>"
        response << "<!DOCTYPE cross-domain-policy SYSTEM \"http://www.macromedia.com/xml/dtds/cross-domain-policy.dtd\">"
        response << "<cross-domain-policy>"

        # use the configuration settings to determine who
        # can connect via the flash socket
        if accepted.empty?
          response << allow_tag("*")
        else
          accepted.each do |domain|
            response << allow_tag(domain)
          end
        end

        response << "</cross-domain-policy>"
        response
      end

      private

      def self.allow_tag domain
        "<allow-access-from domain=\"#{domain}\" to-ports=\"#{settings.get(:port)}\"/>"
      end

    end
  end
end