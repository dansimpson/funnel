require 'fileutils'

module Funnel
  module Generators
    class Application

      def generate destination, options={}
        FileUtils.cp_r(template_dir, destination)
      end

      private

      def template_dir tpl="application"
        File.expand_path("../../../../templates/#{tpl}",  __FILE__)
      end
    end
  end
end