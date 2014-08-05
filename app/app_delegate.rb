class AppDelegate
  attr_accessor :status_menu

  UUID = NSUUID.alloc.initWithUUIDString("B91A2F40-2725-4926-8E3B-AB18425ACC11")

  def applicationDidFinishLaunching(notification)
    ap __method__
    @app_name = NSBundle.mainBundle.infoDictionary['CFBundleDisplayName']

    @status_menu = NSMenu.new

    @status_item = NSStatusBar.systemStatusBar.statusItemWithLength(NSVariableStatusItemLength).init
    @status_item.setMenu(@status_menu)
    @status_item.setHighlightMode(true)
    @status_item.setTitle(@app_name)

    @status_menu.addItem createMenuItem("開啟", 'iBeaconStart')
    @status_menu.addItem createMenuItem("關閉", 'iBeaconStop')
    # @status_menu.addItem createMenuItem("Custom Action", 'pressAction')
    @status_menu.addItem createMenuItem("About #{@app_name}", 'orderFrontStandardAboutPanel:')
    @status_menu.addItem createMenuItem("Quit", 'terminate:')
  end

  def createMenuItem(name, action)
    ap __method__
    NSMenuItem.alloc.initWithTitle(name, action: action, keyEquivalent: '')
  end

  def iBeaconStart
    ap __method__
    identifier = "tw.edu.sce.pccu.ibeacon" # "com.willrax.region"
    @beaconRegion = BLCBeaconAdvertisementData.alloc.initWithProximityUUID UUID, major: 10, minor: 0, measuredPower: -58
    @peripheralManager = CBPeripheralManager.alloc.initWithDelegate(self, queue: nil)
  end

  def iBeaconStop
    ap __method__
    @peripheralManager.stopAdvertising
  end

  def peripheralManagerDidUpdateState(peripheral)
    ap __method__
    if peripheral.state == CBPeripheralManagerStatePoweredOn
      @peripheralManager.startAdvertising @beaconRegion.beaconAdvertisement
    end
  end

  def pressAction
    ap __method__
    alert = NSAlert.alloc.init
    alert.setMessageText "Action triggered from status bar menu"
    alert.addButtonWithTitle "OK"
    alert.runModal
  end
end
