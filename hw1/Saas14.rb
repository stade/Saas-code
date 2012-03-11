class Dessert
  attr_accessor :name, :calories
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    if @calories < 200
      return true
    else
      return false
    end
  end
  def delicious?
    if self.instance_of?(Dessert)
      return true
    else
      return false
    end
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end
  def delicious?
    if self.flavor.eql?("black licorice") && self.instance_of?(JellyBean)
      return false
  else
      return true
    end
  end
end


#dessert = Dessert.new("pudding", 199)
#dessert.healthy?
#dessert.delicious?

#bl = JellyBean.new("jelly",201,"black licorice")
#bl.healthy?
#bl.delicious?

