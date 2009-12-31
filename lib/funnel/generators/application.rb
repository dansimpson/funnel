require 'fileutils'

module Funnel
  module Generators
    class Application
   
      def generate destination, options
        FileUtils.cp_r(template_dir, destination, options)
      end

      def template_dir
        File.expand_path('../../../templates/application',  __FILE__)
      end
    end
  end
end