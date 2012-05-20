class MapState
  attr_accessor :current_pins
  def self.currentPins=(array)
    array.writeToFile('~/Library/wilds.plist'.stringByExpandingTildeInPath, atomically:true)
  end
  
  def self.addPin(id)
    self.currentPins = (currentPins.map.to_a << id)
  end
  
  def self.currentPins
    NSArray.alloc.initWithContentsOfFile('~/Library/wilds.plist'.stringByExpandingTildeInPath) || []
  end
end