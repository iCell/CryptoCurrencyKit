Pod::Spec.new do |spec|
  spec.name         = 'CryptoCurrencyKit'
  spec.version      = '0.1.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/iCell/CryptoCurrency'
  spec.authors      = { 'iCell' => 'icell.vip@gmail.com' }
  spec.summary      = 'A Swift crypto-currencies price library for accessing coinmarket APIs.'
  spec.source       = { :git => 'https://github.com/iCell/CryptoCurrency.git', :tag => spec.version }
  spec.source_files = 'Sources/*.swift'
  spec.framework    = 'Foundation'
end