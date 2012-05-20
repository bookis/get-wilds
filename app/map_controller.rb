class MapController < UIViewController
  
  def viewDidLoad
    @mapView = MKMapView.alloc.initWithFrame(view.bounds)
    @mapView.setShowsUserLocation(true)
    view.addSubview @mapView
    @coordinate = CLLocationCoordinate2D.new(45.563408, -122.629765)
    setRegion(@coordinate)
    set_pins(@coordinate)
    @mapView.delegate = self
  end
  
  def mapView(mapView, regionDidChangeAnimated: animated)
    set_pins mapView.centerCoordinate
  end
  
  def set_pins(coordinate)
    @request = WildsRequest.new(coordinate)
    Pin.populate_map(@request.locations, @mapView)
  end
  
  def setRegion(coordinate)
    @span    = MKCoordinateSpan.new(0.52, 0.52)
    @region  = MKCoordinateRegion.new(coordinate, @span)
    @mapView.setRegion(@region, animated: "YES")
  end
  
end