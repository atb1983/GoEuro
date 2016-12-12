platform :ios, '8.0'
inhibit_all_warnings!
use_frameworks!

def shared_pods
	
pod 'MBProgressHUD', '~> 1.0'
pod 'AFNetworking', '~> 3.1'
end

target 'GoEuroTest' do
	shared_pods
end

target 'GoEuroTestTests' do
	shared_pods
end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
