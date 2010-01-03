require 'fileutils'

module Funnel
  module Generators
    class Application
   
   
      def generate destination, options={}
        FileUtils.cp_r(template_dir, destination)
        
        if options[:amqp]
          FileUtils.cp_r(template_dir("amqp"), destination)
        end
        
        if options[:xmpp]
          FileUtils.cp_r(template_dir("xmpp"), destination)
        end
        
        if options[:twitter]
          FileUtils.cp_r(template_dir("twitter"), destination)
        end
      end
      
      private
      
      def template_dir tpl="application"
        File.expand_path("../../../../templates/#{tpl}",  __FILE__)
      end
    end
  end
end