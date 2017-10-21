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
    
    func setUpBackgroundGradient()->CAGradientLayer {
        let backgroundGradient = CAGradientLayer()
        backgroundGradient.frame = frame
        backgroundGradient.startPoint = CGPoint(x: 0.9, y: 0.1)
        backgroundGradient.endPoint = CGPoint(x: 0.9, y: 0.9)
        backgroundGradient.colors = [UIColor.purple.cgColor, UIColor.blue.cgColor, UIColor.cyan.cgColor, UIColor.green.cgColor, UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.purple.cgColor, UIColor.blue.cgColor, UIColor.cyan.cgColor, UIColor.green.cgColor, UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.purple.cgColor, UIColor.blue.cgColor, UIColor.cyan.cgColor, UIColor.green.cgColor, UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor]
        return backgroundGradient
    }
    
    func initialSetup(withFrame: CGRect){
        frame = withFrame
        backgroundColor = UIColor.white.cgColor
        currentPoint = frame.height / 2
        reDrawGradients(forCurrentPoint: currentPoint)
        addSublayer(positiveGradient)
        addSublayer(negativeGradient)
        insertSublayer(setUpBackgroundGradient(), below: positiveGradient)
    }
    
    func reDrawGradients(forCurrentPoint: CGFloat){
        currentPoint = forCurrentPoint
        positiveGradient.frame = CGRect(x: 0, y: 0, width: frame.width, height: forCurrentPoint - 20)
        positiveGradient.borderWidth = 1.0
        positiveStartPoint = CGPoint(x: 0.1, y:0.3)
        positiveEndPoint = CGPoint(x:0.9, y:0.9)
        positiveGradient.startPoint = positiveStartPoint
        positiveGradient.endPoint = positiveEndPoint
        positiveGradient.colors = postiveColors
        negativeGradient.frame = CGRect(x: 0, y: forCurrentPoint, width: frame.width, height: (frame.height - forCurrentPoint) - 20)
        negativeGradient.borderWidth = 2.0
        negativeStartPoint = CGPoint(x: 0.1, y: 0.3)
        negativeEndPoint = CGPoint(x: 0.9, y: 0.9)
        negativeGradient.startPoint = positiveStartPoint
        negativeGradient.endPoint = negativeEndPoint
        negativeGradient.colors = negativeColors
    }
}

