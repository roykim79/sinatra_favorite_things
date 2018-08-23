require 'rspec'
require 'thing'

describe 'Thing' do
  before :each do
    Thing.clear()
  end

  describe '.all' do
    it 'is empty at first' do
      expect(Thing.all()).to eq([])
    end
  end

  describe '.clear' do
    it 'empties things list' do
      thing = Thing.new('foo')
      thing.save()
      Thing.clear()
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
