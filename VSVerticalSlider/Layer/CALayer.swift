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
//    
//    var postiveColors = [UIColor.blueColor().CGColor, UIColor.cyanColor().CGColor, UIColor.whiteColor().CGColor, UIColor.clearColor().CGColor,  UIColor.whiteColor().CGColor]
//    var negativeColors = [UIColor.orangeColor().CGColor, UIColor.whiteColor().CGColor, UIColor.clearColor().CGColor,UIColor.whiteColor().CGColor, UIColor.orangeColor().CGColor]
    
    var currentPoint: CGFloat!
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpBackgroundGradient()->CAGradientLayer {
        
        let backgroundGradient = CAGradientLayer()
        backgroundGradient.frame = self.frame
        //backgroundGradient.startPoint = CGPointMake(0.9, 0.1)
        //backgroundGradient.endPoint = CGPointMake(0.9, 0.9)
//        backgroundGradient.colors = [UIColor.purpleColor().CGColor, UIColor.blueColor().CGColor, UIColor.cyanColor().CGColor, UIColor.greenColor().CGColor, UIColor.redColor().CGColor, UIColor.orangeColor().CGColor, UIColor.yellowColor().CGColor, UIColor.purpleColor().CGColor, UIColor.blueColor().CGColor, UIColor.cyanColor().CGColor, UIColor.greenColor().CGColor, UIColor.redColor().CGColor, UIColor.orangeColor().CGColor, UIColor.yellowColor().CGColor, UIColor.purpleColor().CGColor, UIColor.blueColor().CGColor, UIColor.cyanColor().CGColor, UIColor.greenColor().CGColor, UIColor.redColor().CGColor, UIColor.orangeColor().CGColor, UIColor.yellowColor().CGColor, UIColor.purpleColor().CGColor, UIColor.blueColor().CGColor, UIColor.cyanColor().CGColor, UIColor.greenColor().CGColor, UIColor.redColor().CGColor, UIColor.orangeColor().CGColor, UIColor.yellowColor().CGColor]
        
        
        return backgroundGradient
    }
    
    func initialSetup(withFrame: CGRect){
        
        self.frame = withFrame
        self.backgroundColor = UIColor.white.cgColor
        
        self.currentPoint = self.frame.height / 2
        //self.reDrawGradients(self.currentPoint)
        
        self.addSublayer(positiveGradient)
        self.addSublayer(negativeGradient)
        self.insertSublayer(self.setUpBackgroundGradient(), below: positiveGradient)
    }
    
    
    func reDrawGradients(forCurrentPoint: CGFloat){
        
        self.currentPoint = forCurrentPoint
        
        //positiveGradient.frame = CGRect(0, 0, self.frame.width, forCurrentPoint - 20)
        positiveGradient.borderWidth = 1.0
        
        positiveStartPoint = CGPoint(x: 0.1, y:0.3)
        positiveEndPoint = CGPoint(x:0.9, y:0.9)
        positiveGradient.startPoint = positiveStartPoint
        positiveGradient.endPoint = positiveEndPoint
        
        //positiveGradient.colors = postiveColors
        
        //negativeGradient.frame = CGRect(0, forCurrentPoint, self.frame.width, (self.frame.height - forCurrentPoint) - 20)
        negativeGradient.borderWidth = 2.0
        
        //negativeStartPoint = CGPoint(0.1, 0.3)
       // negativeEndPoint = CGPoint(0.9, 0.9)
        
        negativeGradient.startPoint = positiveStartPoint
        negativeGradient.endPoint = negativeEndPoint
        
        //negativeGradient.colors = negativeColors
    }
}

