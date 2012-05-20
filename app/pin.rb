class Pin
  attr_accessor :longitude, :latitude, :name, :public, :pin, :notes_count, :id
  
  def initialize(hash)
    @longitude   = hash["longitude"]
    @latitude    = hash["latitude"]
    @name        = hash["name"]
    @public      = hash["public"]
    @notes_count = hash["notes_count"]
    @id          = hash["id"]
    @marker      = nil
  end
  
  def place_on_map(map=nil)
    @map ||= map
    @marker = MKPointAnnotation.alloc.init
    @marker.setCoordinate CLLocationCoordinate2D.new(latitude, longitude)

    @pin_view = MKPinAnnotationView.alloc.initWithAnnotation(@marker, reuseIdentifier: "id")
    @pin_view.animatesDrop = true
    @map.addAnnotation @marker
    MapState.addPin self.id
    @marker.setTitle name
    @marker.setSubtitle "#{notes_count} Notes"
  end
  
  def self.populate_map(locations, map)
    locations.each { |location| Pin.new(location).place_on_map(map) }
  end
end