require 'spec_helper'

describe Iterm2Escape::Tab do
  it 'uses the right escape code for the tab title' do
    Iterm2Escape::Writer.should_receive(:write).with("\033]1;my tab\a")
    Iterm2Escape::Tab.title = 'my tab'
  end

  it 'uses the right escape code for the window title' do
    Iterm2Escape::Writer.should_receive(:write).with("\033]2;my window\a")
    Iterm2Escape::Tab.window_title = 'my window'
  end

  it 'uses the right escape code for setting all titles' do
    Iterm2Escape::Writer.should_receive(:write).with("\033]0;everywhere\a")
    Iterm2Escape::Tab.all_titles = 'everywhere'
  end
end
