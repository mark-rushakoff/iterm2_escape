require 'spec_helper'

describe Iterm2Escape::Writer do
  it 'writes when the environment variables look like iTerm2' do
    ENV.stub(:[]).with('TERM_PROGRAM').and_return('iTerm.app')
    $stdout.should_receive(:write).with('Hi')
    Iterm2Escape::Writer.write('Hi')
  end

  it 'silently does not write when the environment variables do not look like iTerm2' do
    ENV.stub(:[]).with('TERM_PROGRAM').and_return('Apple_Terminal')
    $stdout.should_not_receive(:write)
    Iterm2Escape::Writer.write('Hi')
  end
end
