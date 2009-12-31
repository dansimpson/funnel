class Logger
  
  @@threshhold = 3
  
  def self.info msg
    log msg if @@threshhold <= 3
  end
  
  def self.debug msf
    log msg if @@threshhold <= 1
  end
  
  def self.warning msg
    log msg if @@threshhold <= 2
  end
  
  private
  
  def self.log msg
    puts "#{Time.now} - #{msg}"
  end
  
  
end