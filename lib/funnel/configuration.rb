module Funnel

  class Configuration 

    @@map = {
      :host               => "0.0.0.0",
      :port               => 4000,
      :accepted_origins   => []
    }

    def self.get key
      @@map[key.to_sym]
    end

    def self.put key, val
      @@map[key.to_sym] = val
    end

    def self.load file
      begin
        settings = YAML.load_file(File.join(FUNNEL_ROOT, file))
        settings.each do |key, val|
          put key, val
        end
      rescue
        raise IOError, "#{File.join(FUNNEL_ROOT, file)} could not be loaded."
      end
    end

  end

end