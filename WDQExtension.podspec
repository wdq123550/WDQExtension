#
# Be sure to run `pod lib lint WDQExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WDQExtension'
  s.version          = '1.0.0'
  s.summary          = 'iOS Swift + UIKit development util'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  a easy way to work for ios with swift and uikit
                       DESC

  s.homepage         = 'https://github.com/wdq123550/WDQExtension.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wdq123550' => 'wdqandlq@icloud.com' }
  s.source           = { :git => 'https://github.com/wdq123550/WDQExtension.git', :tag => '1.0.0' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '15.0'

  s.source_files = 'WDQExtension/Classes/**/*'
  s.swift_version = '5.5'
  
  # s.resource_bundles = {
  #   'WDQExtension' => ['WDQExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'Foundation', 'UIKit', 'Photos', 'PhotosUI'
   s.dependency 'Alamofire', '~> 5.9.1'
   s.dependency 'DeviceKit', '~> 5.4.0'
   s.dependency 'CryptoSwift', '~> 1.8.3'
   s.dependency 'KeychainAccess', '~> 4.2.2'
   s.dependency 'RxSwift', '~> 6.7.1'
   s.dependency 'RxCocoa', '~> 6.7.1'
   s.dependency 'SmartCodable', '~> 4.1.3'
   s.dependency 'SnapKit', '~> 5.7.1'
   s.dependency 'SVProgressHUD', '~> 2.3.1'
   s.dependency 'RSKGrowingTextView', '~> 8.0.0'
   
end
