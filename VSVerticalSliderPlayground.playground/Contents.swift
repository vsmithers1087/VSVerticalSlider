//: Playground - noun: a place where people can play

import UIKit
import VSVerticalSlider
import PlaygroundSupport


let containerView = UIView(frame: CGRect(x: 20, y: 20, width: 500, height: 500))
containerView.backgroundColor = UIColor.orange
let slider = VerticalSlider(size: SliderSize.Large, origin: CGPoint(x: 20, y: 20))
slider.backgroundColor = UIColor.white
containerView.addSubview(slider)
PlaygroundPage.current.liveView = containerView
