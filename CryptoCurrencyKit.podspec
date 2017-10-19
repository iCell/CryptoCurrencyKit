Pod::Spec.new do |s|
  s.name         = 'CryptoCurrencyKit'
  s.version      = '0.3.1'
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = 'https://github.com/iCell/CryptoCurrency'
  s.authors      = { 'iCell' => 'icell.vip@gmail.com' }
  s.summary      = 'A Swift crypto-currencies price library for accessing coinmarket APIs.'
  
  s.source       = { :git => 'https://github.com/iCell/CryptoCurrency.git', :tag => s.version }
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'

  s.source_files = 'Sources/*.swift'
  s.framework    = 'Foundation'
end