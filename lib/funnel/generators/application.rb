require 'fileutils'

module Funnel
  module Generators
    module Application
   
      def generate destination, options
        FileUtils.cp_r(File.expand_path('../../../templates/application',  __FILE__), destination, options)
      end
      
    end
  end
end