module Iterm2Escape
  module Writer
    class << self
      def write(message)
        return unless ENV['TERM_PROGRAM'] == 'iTerm.app'
        $stdout.write(message)
      end
    end
  end
end
