require 'iterm2_escape/writer'

module Iterm2Escape
  module Tab
    class << self
      # Sets the tab title
      #
      # @param [String] title What to use for the tab title
      def title=(title)
        Writer.write "\033]1;#{title}\a"
      end

      # Sets the window title
      #
      # @param [String] title What to use for the window title
      def window_title=(title)
        Writer.write "\033]2;#{title}\a"
      end

      # Sets both the tab and window titles
      #
      # @param [String] title What to use for the titles
      def all_titles=(title)
        Writer.write "\033]0;#{title}\a"
      end
    end
  end
end
