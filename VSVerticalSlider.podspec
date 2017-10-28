
Pod::Spec.new do |spec|

  spec.name = 'VSVerticalSlider'
  spec.version = '1.0.0'
  spec.summary = 'Animatable and customizable vertical slider written in Swift4'
  spec.homepage = 'https://github.com/vsmithers1087'
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { 'Vincent Smithers' => 'vsmithers1087@gmail.com' }

  spec.platform = :ios, '10.0'
  spec.requires_arc = true
  spec.resource = 'Resources/VSVerticalSlider.bundle'
  spec.source = { git: 'https://github.com/vsmithers1087/VSVerticalSlider', tag: 'v#{1.0.0}', submodules: false }
  spec.source_files = 'VSVerticalSlider/**/*.{h,swift}'
end
