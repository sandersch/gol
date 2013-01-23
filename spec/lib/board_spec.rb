require 'board'

describe Board do
  context 'an empty board' do
    it 'has no rows' do
      subject.row_count.should == 0
    end
  end

  context 'a board with a cell' do
    subject { described_class.build(1, 1) }

    it 'has one row' do
      subject.row_count.should == 1
    end
  end
end

