module Funnel
  module WebSocket

    class Headers

      PATH_PATTERN    = /^GET (\/[^\s]*) HTTP\/1\.1$/
  		HEADER_PATTERN  = /^([^:]+):\s*([^$]+)/

  		# Parse http style headers into a ruby hash
  		def self.parse data
  			lines = data.split("\r\n")
        line  = lines.shift

  			headers = {}

        if line =~ PATH_PATTERN
          headers[:path] = PATH_PATTERN.match(line)[1]
        else
          throw "Unrecognized Header!"
        end

  			lines.each do |line|
  				kvp = HEADER_PATTERN.match(line)
  				headers[kvp[1].strip.downcase.to_sym] = kvp[2].strip
  			end

  			headers
  		end

  		# encode ruby hash into HTTP style headers
  		def self.encode data
  			result = ""

  			data.each_pair do |k,v|
  				result << k.to_s
  				result << ": "
  				result << v.to_s
  				result << "\r\n"
  			end

  			result << "\r\n"
  			result
  		end

    end

  end
end