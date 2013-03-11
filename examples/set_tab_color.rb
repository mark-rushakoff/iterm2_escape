require 'iterm2_escape'

abort "Usage: #{$0} RED GREEN BLUE" unless ARGV.size == 3

red, green, blue = *ARGV.map(&:to_i)
Iterm2Escape::Tab.set_color(red, green, blue)
