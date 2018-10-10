
platform :ios, '9.0'

workspace "LogPod.xcworkspace"
def basePod
    pod 'Realm'
    pod 'zipzap', '~> 8.1.1'
    pod 'CocoaLumberjack'
end

target 'LogPod' do
  # use_frameworks!
  project 'LogPod/LogPod.xcodeproj'
  basePod
  target 'LogPodTests' do
    inherit! :search_paths
  end

end

target 'Example' do
    # use_frameworks!
    project 'Example/Example.xcodeproj'
    basePod
end
