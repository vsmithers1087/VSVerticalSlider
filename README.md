# VerticalSlider

<img src="https://github.com/vsmithers1087/VerticalSlider/blob/master/ReadmeImages/sliders.png" height="350" width="700">

An animatable and customizable vertical slider written in Swift 4.

<img src="https://github.com/vsmithers1087/VerticalSlider/blob/master/ReadmeImages/demo.gif" height="350" width="200">

## Quick Start

## VerticalSliderPlayground
1. Clone Repo
2. Open VSVerticalSlider.xcworkspace
3. In the file navigator open VerticalSliderPlayground
4. Build with iPhone 8 set as device
5. Open assistent editor and set to Live View

For more information on interactive playgrounds [read this]() blog post by Apple Developer

## Sample Project
1. Clone Repo
2. Open VSVerticalSliderSample.xcworkspace 
3. Build and run.

## Installation
### CocoaPods
`VerticalSlider` can be installed with [CocoaPods]() by adding this to your `Podfile`:
```Ruby
platform :ios, ’10.0’

target 'VerticalSliderSample' do

  use_frameworks!
  pod 'VerticalSlider', :git => 'https://github.com/vsmithers1087/VerticalSlider.git'

end
```

## Setup
1. Create `VSVerticalSlider` with height, color, and optional `x, y` offsets
2. Set the slider's delegate to self
3. Add to your UIView
```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
    }
    
    private func setupSlider() {
        let slider = VSVerticalSlider(height: 500.0 - 13, primaryColor: UIColor.red, offsetX: 20, offsetY: 40.0)
        slider.delegate = self
        view.addSubview(slider)
    }
```
### Conforming to VerticalSliderDelegate
Receive a callback everytime the slider value changes
```swift
extension ViewController: VSVerticalSliderDelegate {
    func valueDidChange(value: Int) {
        percentageLabel.text = "\(value) %"
    }
}
```
### Setting Slider Value
```swift
//A value between 0 and 100
let newValue = 51
slider.setValue(newValue)
```

## Todo
- [x] Add Readme
- [ ] Setup With Storyboards
- [ ] Carthage Support
- [ ] Unit Tests

## Prerequisites
- **Xcode 9.0** +
- **Swift 4.0** +
- **iOS 10.0** +

## Contributing
All feedback and suggestions are welcome. If you see an issue, would like to make a change, or add a feature please make a pull request.

## License
`VerticalSlider`is released under the [MIT License](LICENSE).
