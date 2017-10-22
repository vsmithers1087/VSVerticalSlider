//
//  CALayer.swift
//  VSVerticalSlider
//
//  Created by Vincent Smithers on 10/10/17.
//  Copyright © 2017 Vincent Smithers. All rights reserved.
//

import UIKit

class GradientFill: CALayer {
    
    var positiveGradient = CAGradientLayer()
    var negativeGradient = CAGradientLayer()
    var positiveStartPoint = CGPoint()
    var negativeStartPoint = CGPoint()
    var positiveEndPoint = CGPoint()
    var negativeEndPoint = CGPoint()
    var postiveColors = [UIColor.blue.cgColor, UIColor.cyan.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor,  UIColor.white.cgColor]
    var negativeColors = [UIColor.orange.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.orange.cgColor]
    var currentPoint: CGFloat!
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackgroundGradient()->CAGradientLayer {
        let backgroundGradient = CAGradientLayer()
        backgroundGradient.frame = frame
        backgroundGradient.startPoint = CGPoint(x: 0.9, y: 0.1)
        backgroundGradient.endPoint = CGPoint(x: 0.9, y: 0.9)
        backgroundGradient.colors = [UIColor.clear]
//        backgroundGradient.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor, UIColor.cyan.cgColor, UIColor.green.cgColor, UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.purple.cgColor, UIColor.blue.cgColor, UIColor.cyan.cgColor, UIColor.green.cgColor, UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.purple.cgColor, UIColor.blue.cgColor, UIColor.cyan.cgColor, UIColor.green.cgColor, UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor]
        return backgroundGradient
    }
    
    func setup(withFrame frame: CGRect){
        self.frame = frame
        backgroundColor = UIColor.white.cgColor
        currentPoint = frame.height / 2
        negativeGradient.colors = negativeColors
        positiveGradient.colors = postiveColors
        drawGradients(forCurrentPoint: currentPoint)
        addSublayer(positiveGradient)
        addSublayer(negativeGradient)
        insertSublayer(setupBackgroundGradient(), below: positiveGradient)
    }
    
    func drawGradients(forCurrentPoint currentPoint: CGFloat){
        self.currentPoint = currentPoint
        setStartingPoints()
        setEndingPoints()
        setGradientFrames()
    }
    
    func setGradientFrames() {
        negativeGradient.frame = CGRect(x: 0, y: currentPoint, width: frame.width, height: (frame.height - currentPoint) - 20)
        negativeGradient.borderWidth = 2.0
        positiveGradient.frame = CGRect(x: 0, y: 0, width: frame.width, height: currentPoint - 20)
        positiveGradient.borderWidth = 1.0
    }
    
    func setStartingPoints() {
        positiveStartPoint = CGPoint(x: 0.1, y:0.3)
        negativeStartPoint = CGPoint(x: 0.1, y: 0.3)
        positiveGradient.startPoint = positiveStartPoint
        negativeGradient.startPoint = positiveStartPoint
    }
    
    func setEndingPoints() {
        positiveEndPoint = CGPoint(x:0.9, y:0.9)
        negativeEndPoint = CGPoint(x: 0.9, y: 0.9)
        positiveGradient.endPoint = positiveEndPoint
        negativeGradient.endPoint = negativeEndPoint
    }
}

