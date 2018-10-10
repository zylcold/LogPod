
Pod::Spec.new do |s|
  s.name             = 'YLLogPod'
  s.version          = '0.1.0'
  s.summary          = 'A short description of YLLogPod.'
  s.description      = <<-DESC
    CocoaLumberjack 简易封装
                       DESC
  s.homepage         = 'https://github.com/zylcold/LogPod.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yunlongz' => 'zylcold@gmail.com' }
  s.source           = { :git => 'https://github.com/zylcold/LogPod.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'LogPod/LogPod/**/*.{h,m}'
  s.public_header_files = 'LogPod/LogPod/YLLog.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'CocoaLumberjack', '== 3.4.2'
  s.dependency 'Realm', '== 3.7.6'
  s.dependency 'zipzap', '== 8.1.1'
end
