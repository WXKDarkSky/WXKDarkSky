#
#  Be sure to run `pod spec lint WXKDarkSky.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "WXKDarkSky"
  s.version      = "2.1.0"
  s.summary      = "A pure-Swift Codable layer over the Dark Sky API."
  s.description  = <<-DESC
                   WXKDarkSky is a simple library written completely in Swift that
provides a Codable layer over the Dark Sky API. It also includes some basic
networking functionality. (If you don't want to use networking functionality, you
can simply pass whatever JSON response you receive into WXKDarkSky and it'll work
just fine.

It's important to note that you should NOT use WXKDarkSky's networking functionality
to make requests from a client-side application. You may be putting your API key at
risk of being compromised if you include your API key in client-facing code. To work
around this, you can use WXKDarkSky without its networking functionality or use a
server-side Swift framework like Vapor to re-serve Dark Sky API responses, obscuring
your API key.
DESC
  s.homepage     = "https://github.com/loopwxservices/WXKDarkSky"
  s.license      = "MIT"
  s.author    = "Loop Weather Services LLC"
  s.source       = { :git => "https://github.com/loopwxservices/WXKDarkSky.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*.{swift}"
  s.ios.deployment_target = "8.0"
  s.swift_version = "4.0"
end
