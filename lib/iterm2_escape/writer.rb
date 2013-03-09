module Iterm2Escape
  module Writer
    class << self
      def write(message)
        return unless should_write?
        $stdout.write(message)
      end

      def should_write?
        (ENV['SUPPRESS_ITERM2_ESCAPE_GEM'].nil? || ENV['SUPPRESS_ITERM2_ESCAPE_GEM'].empty?) &&
          ENV['TERM_PROGRAM'] == 'iTerm.app'
      end
    end
  end
end
