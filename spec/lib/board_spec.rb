require 'board'

describe Board do
  context 'a board with a cell' do
    let(:cell) { mock :cell }
    let(:dimensions) { Dimensions.new(1, 1) }

    subject do
      described_class.build(dimensions) do |row, col|
        cell
      end
    end

    it 'has one row' do
      subject.row_count.should == 1
    end

    context 'a row with two cells' do
      let(:dimensions) { Dimensions.new(1, 2) }

      it 'has one row' do
        subject.row_count.should == 1
      end
    end

    context 'a board with two rows' do
      let(:dimensions) { Dimensions.new(2, 1) }

      it 'has two rows' do
        subject.row_count.should == 2
      end
    end
  end

  describe 'initializing a board' do
  end
end

