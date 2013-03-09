require 'spec_helper'

describe Iterm2Escape::TabColor do
  shared_examples_for 'a color' do
    let(:method) { (color.to_s + '=').to_sym }
    it 'rejects values less than 0' do
      expect {
        Iterm2Escape::TabColor.public_send(method, -1)
      }.to raise_error(ArgumentError, /0-255/)
    end

    it 'rejects values more than 255' do
      expect {
        Iterm2Escape::TabColor.public_send(method, 256)
      }.to raise_error(ArgumentError, /0-255/)
    end

    it 'accepts values in between 0-255' do
      Iterm2Escape::Writer.should_receive(:write).with(color_128_message)

      Iterm2Escape::TabColor.public_send(method, 128)
    end
  end

  let(:color_128_message) { "\033]6;1;bg;#{color};brightness;128\a" }

  describe '.red=' do
    let(:color) { :red }
    it_should_behave_like 'a color'
  end

  describe '.green=' do
    let(:color) { :green }
    it_should_behave_like 'a color'
  end

  describe '.blue=' do
    let(:color) { :blue }
    it_should_behave_like 'a color'
  end

  describe '.set_color' do
    it 'delegates to red=, green=, blue=' do
      # papayawhip, a particularly strange-named HTML color
      Iterm2Escape::TabColor.should_receive(:red=).with(255)
      Iterm2Escape::TabColor.should_receive(:green=).with(238)
      Iterm2Escape::TabColor.should_receive(:blue=).with(221)

      Iterm2Escape::TabColor.set_color(255, 238, 221)
    end
  end
end
