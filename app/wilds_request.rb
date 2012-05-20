class WildsRequest
  attr_accessor :locations
  
  def initialize(coordinate)
    url = "http://foodsquatting.heroku.com/.json?lat=#{coordinate.latitude}&lng=#{coordinate.longitude}"
    error_ptr  = Pointer.new(:object)
    data       = NSData.alloc.initWithContentsOfURL(NSURL.URLWithString(url), options:NSDataReadingUncached, error:error_ptr)
    locations  = NSJSONSerialization.JSONObjectWithData(data, options:0, error:error_ptr)["locations"]
    @locations = locations.map.to_a.delete_if {|location| MapState.currentPins.include? location["id"] }
  end
  
end