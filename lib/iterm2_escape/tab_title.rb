require 'iterm2_escape/writer'

module Iterm2Escape
  module Tab
    class << self
      def title=(title)
        Writer.write "\033]1;#{title}\a"
      end

      def window_title=(title)
        Writer.write "\033]2;#{title}\a"
      end

      def all_titles=(title)
        Writer.write "\033]0;#{title}\a"
      end
    end
  end
end
