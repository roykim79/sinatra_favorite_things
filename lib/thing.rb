class Thing
  @@things = []

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.all()
    @@things
  end

  def self.clear()
    @@things = []
  end

  def save()
    @@things.push(self)
  end

end
