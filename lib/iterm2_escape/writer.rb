module Iterm2Escape
  module Writer
    class << self
      def write(message)
        $stdout.write(message) if should_write?
      end

      def should_write?
        !is_suppressed? && is_iterm? && is_tty?
      end

      private
      def is_suppressed?
        !(ENV['SUPPRESS_ITERM2_ESCAPE_GEM'].nil? || ENV['SUPPRESS_ITERM2_ESCAPE_GEM'].empty?)
      end

      def is_iterm?
        # seems like it doesn't *really* matter if we're on iTerm2 -- but let's play it safe
        ENV['TERM_PROGRAM'] == 'iTerm.app'
      end

      def is_tty?
        $stdout.tty?
      end
    end
  end
end
