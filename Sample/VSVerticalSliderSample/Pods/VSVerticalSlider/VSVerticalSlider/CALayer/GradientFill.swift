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
    var primaryColor: UIColor!
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(withFrame frame: CGRect, primaryColor: UIColor) {
        self.frame = frame
        self.primaryColor = primaryColor
        setColors(color: primaryColor)
        currentPoint = frame.height / 2
        negativeGradient.colors = negativeColors
        positiveGradient.colors = postiveColors
        drawGradients(forCurrentPoint: currentPoint)
        setBackgroundGradient()
        addSublayer(positiveGradient)
        addSublayer(negativeGradient)
    }
    
    func setColors(color: UIColor) {
        guard let compliment = UIColor.getCompliment(color: color) else { return }
        postiveColors = getColorArray(color: color, count: 13)
        negativeColors = getColorArray(color: compliment, count: 13)
    }
    
    func getColorArray(color: UIColor, count: Int) -> [CGColor] {
        let colors = (0...count).map { (idx) -> CGColor in
            let selectedColor = idx % 2 == 0 ? UIColor.white.cgColor : color.cgColor
            return selectedColor
        }
        return colors
    }
    
    func setBackgroundGradient() {
        let backgroundGrandient = CAGradientLayer()
        backgroundGrandient.frame = frame
        guard let analagousColor = UIColor.getAnalagous(color: primaryColor) else { return }
        let analagousColors = getColorArray(color: analagousColor, count: 13)
        backgroundGrandient.colors = analagousColors
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
        positiveStartPoint = CGPoint(x: 0.1, y:0.1)
        negativeStartPoint = CGPoint(x: 0.1, y: 0.1)
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

