require 'iterm2_escape'

abort "Usage: #{$0} RED GREEN BLUE" unless ARGV.size == 3

Iterm2Escape::Tab.set_color(*(ARGV.map(&:to_i)))
