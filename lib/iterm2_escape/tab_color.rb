require 'iterm2_escape/writer'

module Iterm2Escape
  module TabColor
    class << self
      def red=(red)
        raise ArgumentError, "Value must be in range 0-255" unless (0..255).include?(red)
        Writer.write "\033]6;1;bg;red;brightness;#{red}\a"
      end

      def green=(green)
        raise ArgumentError, "Value must be in range 0-255" unless (0..255).include?(green)
        Writer.write "\033]6;1;bg;green;brightness;#{green}\a"
      end

      def blue=(blue)
        raise ArgumentError, "Value must be in range 0-255" unless (0..255).include?(blue)
        Writer.write "\033]6;1;bg;blue;brightness;#{blue}\a"
      end

      def set_color(red, green, blue)
        self.red = red
        self.green = green
        self.blue = blue
      end
    end
  end
end
