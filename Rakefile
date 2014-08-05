# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/osx'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'ibeacon'
  app.info_plist['LSUIElement'] = true


  app.vendor_project('libs/BLCBeaconAdvertisementData', :static)
  app.frameworks += ["CoreLocation", "CoreBluetooth", 'IOBluetooth']

end
