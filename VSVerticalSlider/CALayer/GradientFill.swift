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
    var postiveColors = [CGColor]()
    var negativeColors = [CGColor]()
    var currentPoint: CGFloat!
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(withFrame frame: CGRect, primaryColor: UIColor) {
        self.frame = frame
        setColors(color: primaryColor)
        currentPoint = frame.height / 2
        negativeGradient.colors = negativeColors
        print(negativeGradient.colors?.count)
        positiveGradient.colors = postiveColors
        drawGradients(forCurrentPoint: currentPoint)
        setBackgroundGradient()
        addSublayer(positiveGradient)
        addSublayer(negativeGradient)
    }
    
    func setColors(color: UIColor) {
        guard let compliment = UIColor.getCompliment(color: color) else { return }
        postiveColors = (0...6).map({ (idx) -> CGColor in
            let selectedColor = idx % 2 == 0 ? UIColor.white.cgColor : color.cgColor
            return selectedColor
        })
        
        negativeColors = (0...6).map({ (idx) -> CGColor in
            let selectedColor = idx % 2 == 0 ? UIColor.white.cgColor : compliment.cgColor
            return selectedColor
        })
    }
    
    func setBackgroundGradient() {
        let backgroundGrandient = CAGradientLayer()
        backgroundGrandient.colors = [UIColor.yellow.cgColor, UIColor.purple.cgColor, UIColor.yellow.cgColor, UIColor.purple.cgColor, UIColor.yellow.cgColor, UIColor.purple.cgColor]
        backgroundGrandient.frame = frame
        addSublayer(backgroundGrandient)
    }
    
    func drawGradients(forCurrentPoint currentPoint: CGFloat) {
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

