class Thing
  @@things = []

  attr_accessor :name, :ranking

  def initialize(name, ranking = 9)
    @name = name
    @ranking = ranking
  end

  def self.all()
    @@things
  end

  def self.clear()
    @@things = []
  end

  def self.sort()
    @@things.sort_by! { |obj| obj.ranking }
  end

  def save()
    @@things.push(self)
  end

end
