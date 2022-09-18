require 'active_support/core_ext/string/inflections'
require_relative './inflections'

class Argus
  def initialize(**args)
    @state = args
  end

  def <<(value)
    puts "Entered value: #{value}"
    puts 'State'
    puts @state.inspect
  end
end
