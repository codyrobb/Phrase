Pod::Spec.new do |spec|
  spec.name         = 'Phrase'
  spec.version      = '3.0.0'
  spec.license      = { :type => 'Apache License, Version 2.0' }
  spec.homepage     = 'https://github.com/codyrobb/Phrase'
  spec.authors      = { 'Cody Robertson' => 'codyrobertsonn@gmail.com' }
  spec.summary      = 'A Swift templating library.'
  spec.source       = { :git => 'https://github.com/codyrobb/Phrase.git', :tag => '3.0.0' }
  spec.source_files = 'Sources/*'

  spec.ios.deployment_target  = '14.0'
end
