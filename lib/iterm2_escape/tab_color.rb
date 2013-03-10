require 'iterm2_escape/writer'

module Iterm2Escape
  module Tab
    class << self
      # Sets the red level of the tab's chrome
      #
      # @param [Integer] red Red level (0-255) of the tab's chrome
      def red=(red)
        raise ArgumentError, "Value must be in range 0-255" unless (0..255).include?(red)
        Writer.write "\033]6;1;bg;red;brightness;#{red}\a"
      end

      # Sets the green level of the tab's chrome
      #
      # @param [Integer] green Green level (0-255) of the tab's chrome
      def green=(green)
        raise ArgumentError, "Value must be in range 0-255" unless (0..255).include?(green)
        Writer.write "\033]6;1;bg;green;brightness;#{green}\a"
      end

      # Sets the blue level of the tab's chrome
      #
      # @param [Integer] blue Blue level (0-255) of the tab's chrome
      def blue=(blue)
        raise ArgumentError, "Value must be in range 0-255" unless (0..255).include?(blue)
        Writer.write "\033]6;1;bg;blue;brightness;#{blue}\a"
      end

      # Sets all the color levels of the tab's chrome
      #
      # @param [Integer] red Red level (0-255) of the tab's chrome
      # @param [Integer] green Green level (0-255) of the tab's chrome
      # @param [Integer] blue Blue level (0-255) of the tab's chrome
      def set_color(red, green, blue)
        self.red = red
        self.green = green
        self.blue = blue
      end
    end
  end
end
