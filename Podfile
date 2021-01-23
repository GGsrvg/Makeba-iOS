# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


# LIBS
def	rx
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
end

def	rxTest
  pod 'RxBlocking', '~> 5'
  pod 'RxTest', '~> 5'
end



target 'makeba' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for maker

  pod 'R.swift', '~> 5'
  pod 'LDS', '0.2.3'

  target 'makebaTests' do
    inherit! :search_paths
    # Pods for testing
	rxTest
  end

  target 'makebaUITests' do
    # Pods for testing
  end

end

target 'Data' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Data
  rx
end

target 'API' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for API
  rx
end

target 'Storage' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Storage
  rx
end
