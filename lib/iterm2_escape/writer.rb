module Iterm2Escape
  module Writer
    class << self
      def write(message, target = $stdout)
        target.write(message) if should_write?(target)
      end

      def should_write?(target = $stdout)
        !is_suppressed? && is_iterm? && target.tty?
      end

      private
      def is_suppressed?
        !(ENV['SUPPRESS_ITERM2_ESCAPE_GEM'].nil? || ENV['SUPPRESS_ITERM2_ESCAPE_GEM'].empty?)
      end

      def is_iterm?
        # seems like it doesn't *really* matter if we're on iTerm2 -- but let's play it safe
        ENV['TERM_PROGRAM'] == 'iTerm.app'
      end
    end
  end
end
