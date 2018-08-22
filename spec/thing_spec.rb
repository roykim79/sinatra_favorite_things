require 'rspec'
require 'thing'

describe 'Thing' do
  describe '.all' do
    it 'is empty at first' do
      expect(Thing.all()).to eq([])
    end
  end
end
