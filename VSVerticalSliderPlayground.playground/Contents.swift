//: Playground - noun: a place where people can play

import UIKit
import VSVerticalSlider
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
let color = UIColor.init(red: 0 / 255, green: 50 / 255, blue: 150 / 255, alpha: 1.0)
let containerView = UIView(frame: CGRect(x: 20, y: 20, width: 150, height: 500))
let compliment = UIColor.getAnalagous(color: color)
containerView.backgroundColor = UIColor.white
let slider = VerticalSlider(height: 400.0, primaryColor: color, offsetX: 55, offsetY: 20)
containerView.addSubview(slider)
PlaygroundPage.current.liveView = containerView


