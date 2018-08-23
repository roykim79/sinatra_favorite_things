require 'rspec'
require 'thing'

describe 'Thing' do
  before :each do
    Thing.clear()
  end

  describe '.all' do
    it 'is an empty list at first' do
      expect(Thing.all()).to eq([])
    end
  end

  describe '.clear' do
    it 'empties the things list' do
      thing = Thing.new('foo')
      thing.save()
      Thing.clear()
      expect(Thing.all()).to eq([])
    end
  end

  describe '.sort' do
    it 'sorts the things starting with the lowest ranking' do
      thing = Thing.new('foo', 2)
      thing.save()
      thing1 = Thing.new('bar', 1)
      thing1.save()
      Thing.sort()
      expect(Thing.all()[0].ranking).to eq(1)
    end
  end

  describe '#name' do
    it 'returns the name of the thing' do
      thing = Thing.new('foo')
      expect(thing.name).to eq('foo')
    end

    it 'changes the name of the thing' do
      thing = Thing.new('foo')
      thing.name = 'bar'
      expect(thing.name).to eq('bar')
    end
  end

  describe '#ranking' do
    it 'returns 9 by default if not given a ranking at creation' do
      thing = Thing.new('foo')
      expect(thing.ranking).to eq(9)
    end

    it 'returns the 1 when a new thing is created with 1 given as the ranking parameter' do
      thing = Thing.new('foo', 1)
      expect(thing.ranking).to eq(1)
    end

    it 'changes the ranking value of a thing' do
      thing = Thing.new('foo', 1)
      thing.ranking = 3
      expect(thing.ranking).to eq(3)
    end
  end

  describe '#save' do
    it 'saves a thing to the things list' do
      thing = Thing.new('Foo')
      thing.save()
      expect(Thing.all()).to eq([thing])
    end
  end
end
