require 'argus'

argus = Argus.new

loop do
  read_string = gets
  argus << read_string
  break unless argus.continue?
end
