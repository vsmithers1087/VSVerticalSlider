//: Playground - noun: a place where people can play

import UIKit
import VSVerticalSlider
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
let x = UIImage(named: "test.png")
let newColor = UIColor.init(red: 20 / 255, green: 150 / 255, blue: 200 / 255, alpha: 1.0)
let containerView = UIView(frame: CGRect(x: 20, y: 20, width: 300, height: 500))
containerView.backgroundColor = UIColor.white
let slider = VerticalSlider(height: 400, primaryColor: newColor, positiveImage: x, negativeImage: x)
slider.backgroundColor = UIColor.white
containerView.addSubview(slider)

PlaygroundPage.current.liveView = containerView






