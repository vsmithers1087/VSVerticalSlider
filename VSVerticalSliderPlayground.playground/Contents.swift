//: Playground - noun: a place where people can play

import UIKit
import VSVerticalSlider
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
let x = UIImage(named: "test.png")
let containerView = UIView(frame: CGRect(x: 20, y: 20, width: 500, height: 500))
containerView.backgroundColor = UIColor.orange
let slider = VerticalSlider(size: .Small, positiveImage: x, negativeImage: x)
slider.backgroundColor = UIColor.white
containerView.addSubview(slider)
PlaygroundPage.current.liveView = containerView


