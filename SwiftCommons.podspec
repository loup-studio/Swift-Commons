#
# Be sure to run `pod lib lint SwiftCommons.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftCommons'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SwiftCommons.'

  s.homepage         = 'https://github.com/loup-studio/SwiftCommons'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Lukasz' => 'lukasz@intheloup.io' }
  s.source           = { :git => 'https://github.com/loup-studio/SwiftCommons.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'SwiftCommons/Classes/**/*'

  # dependencies
  s.frameworks = 'UIKit'

  # reactored
  s.dependency 'Reactored'

  # reactive
  s.dependency 'RxSwift', '~> 4'
  s.dependency 'RxGesture', '~> 2'
  s.dependency 'RxDataSources', '~> 3.0'

  # network
  s.dependency 'Alamofire'
  s.dependency 'Moya/RxSwift', '~> 10.0'

  # json
  s.dependency 'ObjectMapper'

  # hud
  s.dependency 'SVProgressHUD'

  # alert
  s.dependency 'Alertift'

  # mortar
  s.dependency 'Mortar/MortarVFL', '~> 1.4'

  # notification
  s.dependency 'SwiftMessages'


  s.description      = <<-DESC
Swift commons
                       DESC

end
