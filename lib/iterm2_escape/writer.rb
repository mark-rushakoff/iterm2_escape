module Iterm2Escape
  module Writer
    class << self
      # Writes the given message if appropriate
      #
      # @param [String] message to print to the target
      # @param [IO] target where to write the message
      def write(message, target = $stdout)
        target.write(message) if should_write?(target)
      end

      # Identifies whether the environment says we should print control messages
      #
      # @param [IO] target where to check regarding writing the message
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
