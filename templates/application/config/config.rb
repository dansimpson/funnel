class Configuration 
  
  @@map = {
    :host => "0.0.0.0",
    :port => 4000
  }
  
  def self.get key
    @@map[key.to_sym]
  end
  
  def self.put key, val
    @@map[key.to_sym] = val
  end
  
end