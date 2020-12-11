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

#def inputMask
#  pod 'InputMask'
#end

def rSwift
  pod 'R.swift', '~> 5'
end

# TARGETS
target 'makeba' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for makeba
  rx
  rSwift

  pod 'LDS', '0.2.3'

#  inputMask

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

target 'MakebaData' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for MakebaData
  rx

  target 'MakebaDataTests' do
    # Pods for testing
    rxTest
  end

end


target 'API' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for API
  rx

end

#target 'MakebaAPI' do
#  # Comment the next line if you don't want to use dynamic frameworks
#  use_frameworks!
#  # Pods for MakebaAPI
#  rx
#
#  target 'MakebaAPITests' do
#    # Pods for testing
#    rxTest
#  end
#
#end

target 'Storage' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  # Pods for Storage
#  rx

end

#target 'MakebaStorage' do
#  # Comment the next line if you don't want to use dynamic frameworks
#  use_frameworks!
#  # Pods for MakebaStorage
#  rx
#  
#  target 'MakebaStorageTests' do
#    # Pods for testing
#    rxTest
#  end
#
#end

