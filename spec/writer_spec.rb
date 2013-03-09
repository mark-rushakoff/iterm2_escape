require 'spec_helper'

describe Iterm2Escape::Writer do
  describe '.should_write?' do
    let(:subject) { Iterm2Escape::Writer.should_write? }
    describe 'when $SUPPRESS_ITERM2_ESCAPE_GEM is set' do
      before { ENV.stub(:[]).with('SUPPRESS_ITERM2_ESCAPE_GEM').and_return('1') }

      describe 'and it looks like we are using iTerm2' do
        before { ENV.stub(:[]).with('TERM_PROGRAM').and_return('iTerm.app') }
        it "will not write" do
          expect(subject).to eq(false)
        end
      end
    end

    describe 'when $SUPPRESS_ITERM2_ESCAPE_GEM is not set' do
      before { ENV.stub(:[]).with('SUPPRESS_ITERM2_ESCAPE_GEM').and_return(nil) }

      describe 'when it looks like we are in iTerm2' do
        before { ENV.stub(:[]).with('TERM_PROGRAM').and_return('iTerm.app') }

        it "will write" do
          expect(subject).to eq(true)
        end
      end

      describe 'when it does not look like we are in iTerm2' do
        before { ENV.stub(:[]).with('TERM_PROGRAM').and_return('Apple_Terminal') }

        it "will not write" do
          expect(subject).to eq(false)
        end
      end
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
