require 'iterm2_escape'
require 'getoptlong'

abort "Usage: #{$0} [--tab TABTITLE] [--window WINDOWTITLE] [--all ALLTITLE]" if ARGV.size == 0

opts = GetoptLong.new(
  ['--tab', '-t', GetoptLong::REQUIRED_ARGUMENT],
  ['--window', '-w', GetoptLong::REQUIRED_ARGUMENT],
  ['--all', '-a', GetoptLong::REQUIRED_ARGUMENT]
)

opts.each do |opt, arg|
  case opt
  when '--tab'
    Iterm2Escape::Tab.title = arg
  when '--window'
    Iterm2Escape::Tab.window_title = arg
  when '--all'
    Iterm2Escape::Tab.all_titles = arg
  end
end
