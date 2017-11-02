//: Playground - noun: a place where people can play

import UIKit
import VSVerticalSlider
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
let color = UIColor.init(red: 100 / 255, green: 100 / 255, blue: 1 / 255, alpha: 1.0)
let containerView = UIView(frame: CGRect(x: 20, y: 20, width: 300, height: 500))
containerView.backgroundColor = UIColor.white
let slider = VerticalSlider(height: 400.0, primaryColor: color, offsetX: 120, offsetY: 20)
containerView.addSubview(slider)
PlaygroundPage.current.liveView = containerView


