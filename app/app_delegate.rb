class AppDelegate
  attr_accessor :current_pins
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    MapState.currentPins= []
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(MapController.new)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    return true
  end
  
end
