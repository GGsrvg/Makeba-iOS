# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def	rx
	pod 'RxSwift', '~> 5'
	pod 'RxCocoa', '~> 5'
end

def	rx_test
    pod 'RxBlocking', '~> 5'
    pod 'RxTest', '~> 5'
end

target 'Data' do
	# Comment the next line if you don't want to use dynamic frameworks
	use_frameworks!

  	# Pods for Data
  	rx

  	target 'DataTests' do
    	# Pods for testing
		rx_test
  	end
end

target 'makeba' do
	# Comment the next line if you don't want to use dynamic frameworks
	use_frameworks!

  	# Pods for makeba
  	rx
	pod 'R.swift', '~> 5'
	pod 'InputMask'

	target 'makebaTests' do
    	inherit! :search_paths
    	# Pods for testing
		rx_test
  	end

  	target 'makebaUITests' do
    	# Pods for testing
  	end
end
