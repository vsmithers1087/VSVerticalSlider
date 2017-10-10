//
//  VerticalSlider.swift
//  VSVerticalSlider
//
//  Created by Vincent Smithers on 10/10/17.
//  Copyright © 2017 Vincent Smithers. All rights reserved.
//

import UIKit

public enum SliderSize {
    case Small
    case Medium
    case Large
}

public class VerticalSlider: UIControl {
    
    var frameWidthConstant: CGFloat = 40.0
    var frameHeightConstant: CGFloat!
    
    private var lowScrollableRange: CGFloat!
    private var highScrollableRange: CGFloat!
    private var offset: CGFloat!
    private var scrollUnit : CGFloat!
    private var gesture: UIPanGestureRecognizer!
    private var negImage: UIImage!
    private var posImage: UIImage!
    
    var gradientFill = GradientFill()
    var currentVal: Int = 50
    var plusImageView : UIImageView {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.backgroundColor = UIColor.black
        imageV.layer.borderWidth = 2.0
        imageV.layer.borderColor = UIColor.orange.cgColor
        imageV.image = posImage
        imageV.contentMode = .scaleAspectFit
        return imageV
    }
    
    var negativeImageView : UIImageView {
        let imageV = UIImageView()
        imageV.translatesAutoresizingMaskIntoConstraints = false
        imageV.backgroundColor = UIColor.black
        imageV.layer.borderWidth = 2.0
        imageV.layer.borderColor = UIColor.orange.cgColor
        imageV.image = negImage
        imageV.contentMode = .scaleAspectFit
        return imageV
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(size: SliderSize, origin: CGPoint){
        
        self.init(frame: CGRect.zero)
        switch size {
        case .Small:
            self.frameHeightConstant = 300.0 + (frameWidthConstant * 2)
        case .Medium:
            self.frameHeightConstant = 400.0 + (frameWidthConstant * 2)
        case .Large:
            self.frameHeightConstant = 500.0 + (frameWidthConstant * 2)
        }
        
        let distanceBetweenPlaceholderAndPoint: CGFloat = 20.0
        
        self.lowScrollableRange = self.frameWidthConstant + distanceBetweenPlaceholderAndPoint - self.frameHeightConstant / 111
        
        self.highScrollableRange = self.frameHeightConstant - self.frameWidthConstant
        
        self.scrollUnit = (highScrollableRange - lowScrollableRange) / 100
        
        self.offset = (self.frameWidthConstant + distanceBetweenPlaceholderAndPoint) / scrollUnit
        
        self.customInit()
    }
    
    func customInit(){
        self.setImages()
        self.setFrame()
        self.setFrameContraints()
        self.setPosImageFrameContraints()
        self.setNegImageFrameContraints()
    }
    
    func setImages(){
        self.posImage = UIImage(named: "Minus")
        self.negImage = UIImage(named: "Plus")
    }
    
    func setUpTouch(target: UIViewController){
        
//        if gesture == nil {
//
//            gesture = UIPanGestureRecognizer(target: target, action: #selector(CustomVerticalSlider.isSliding(_:)))
//
//            self.addGestureRecognizer(gesture!)
//        }
    }
    
    func updateValue(sender: UIView){
        
//        let location = self.gesture.locationInView(sender).y
//
//        if location <= highScrollableRange && location >= lowScrollableRange{
//
//            self.gradientFill.reDrawGradients(location)
//            self.currentVal = Int(abs((self.gradientFill.currentPoint / self.scrollUnit - self.offset) - 100))
//        }
    }
    
    func isSliding(sender: UITapGestureRecognizer) {
        
    }
}

extension VerticalSlider {
    
    
    func setFrame(){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        
        let frame = CGRect(x: 0, y: 0, width: self.frameWidthConstant, height: self.frameHeightConstant)
        
        self.gradientFill.initialSetup(withFrame: frame)
        
        self.layer.addSublayer(self.gradientFill)
        
        self.layoutIfNeeded()
        self.layoutSubviews()
        
    }
    
    
    func setFrameContraints(){
//
//        let width = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: .None, attribute: .NotAnAttribute, multiplier: 1.0, constant: frameWidthConstant)
//
//        let height = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: .None, attribute: .NotAnAttribute, multiplier: 1.0, constant: frameHeightConstant!)
//
//        width.active = true
//        height.active = true
    }
    
    
    func setPosImageFrameContraints(){
//        let trailing = NSLayoutConstraint(item: self.plusImageView, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: 0)
//
//        let leading = NSLayoutConstraint(item: self.plusImageView, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 0)
//
//        let top = NSLayoutConstraint(item: self.plusImageView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0)
//
//        let height = NSLayoutConstraint(item: self.plusImageView, attribute: .Height, relatedBy: .Equal, toItem: .None, attribute: .NotAnAttribute, multiplier: 1.0, constant: self.frameWidthConstant)
//
//        self.addSubview(plusImageView)
//
//        trailing.active = true
//        leading.active = true
//        top.active = true
//        height.active = true
//
//        self.layoutIfNeeded()
    }
    
    func setNegImageFrameContraints(){
//
//        let trailing = NSLayoutConstraint(item: self.negativeImageView, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: 0)
//
//        let leading = NSLayoutConstraint(item: self.negativeImageView, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 0)
//
//        let top = NSLayoutConstraint(item: self.negativeImageView, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0)
//
//        let height = NSLayoutConstraint(item: self.negativeImageView, attribute: .Height, relatedBy: .Equal, toItem: .None, attribute: .NotAnAttribute, multiplier: 1.0, constant: self.frameWidthConstant)
//
//        self.addSubview(negativeImageView)
//
//        trailing.active = true
//        leading.active = true
//        top.active = true
//        height.active = true
        
        self.layoutIfNeeded()
    }
    
    
}
