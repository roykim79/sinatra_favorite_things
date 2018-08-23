require 'rspec'
require 'thing'

describe 'Thing' do
  describe '.all' do
    it 'is empty at first' do
      expect(Thing.all()).to eq([])
    end
  end

  describe '#save' do
    it 'saves a thing to things list' do
      thing = Thing.new('Foo')
      thing.save()
      expect(Thing.all()).to eq([thing])
    end
  end
end
