require 'spec_helper'

describe Iterm2Escape::Writer do
  describe '.should_write?' do
    let(:subject) { Iterm2Escape::Writer.should_write? }

    before do
      ENV.stub(:[]).with('SUPPRESS_ITERM2_ESCAPE_GEM').and_return(nil)
      ENV.stub(:[]).with('TERM_PROGRAM').and_return('iTerm.app')
    end

    shared_examples "will not write", will_write: false do
      it "will not write" do
        expect(subject).to eq(false)
      end
    end

    describe 'when everything is lined up' do
      it 'will write' do
        expect(subject).to eq(true)
      end
    end

    describe 'when it is not iTerm2', will_write: false do
      before { ENV.stub(:[]).with('TERM_PROGRAM').and_return('Apple_Terminal') }
    end

    describe 'when $SUPPRESS_ITERM2_ESCAPE_GEM is set', will_write: false do
      before { ENV.stub(:[]).with('SUPPRESS_ITERM2_ESCAPE_GEM').and_return('1') }
    end

    describe 'when $stdout is not a TTY', will_write: false do
      before { $stdout.stub(:tty?).and_return(false) }
    end
  end

  describe '.write' do
    describe 'when .should_write? is true' do
      before { Iterm2Escape::Writer.stub(:should_write?).and_return(true) }
      it 'writes' do
        $stdout.should_receive(:write).with('Hi')
        Iterm2Escape::Writer.write('Hi')
      end
    end

    describe 'when .should_write? is false' do
      before { Iterm2Escape::Writer.stub(:should_write?).and_return(false) }
      it 'does not write' do
        $stdout.should_not_receive(:write)
        Iterm2Escape::Writer.write('Hi')
      end
    end
  end
end
