# Uncomment the next line to define a global platform for your project
# platform :ios, '11.0'

def networkAndRxPods
  pod 'RxAlamofire', '~> 5'
  pod 'RxSwift', '5.1.1'
  pod 'RxCocoa', '5.1.1'
end

def utilityPods
  pod 'RealmSwift', '~> 10'
  pod 'Kingfisher'
  pod 'AttributedStringBuilder'
  pod 'PopupDialog'
  pod 'IQKeyboardManagerSwift'
  pod 'HorizontalProgressBar'
  pod 'DZNEmptyDataSet'
end

target 'Soft Movies' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Soft Movies
    networkAndRxPods
    utilityPods

  target 'Soft MoviesTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Soft MoviesUITests' do
    # Pods for testing
  end

end
