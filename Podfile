# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
    pod 'R.swift', ’~> 5.2.2'
    pod 'SVProgressHUD'

    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'RxDataSources'
    pod 'RxGesture'

    pod 'Moya/RxSwift', '~> 15.0'
end

target 'my book' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for my book
  common_pods

  target 'my bookTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'my bookUITests' do
    # Pods for testing
  end

end
