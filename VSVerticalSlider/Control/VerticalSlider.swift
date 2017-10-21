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
    private var negImage: UIImage!
    private var posImage: UIImage!
    
    var gradientFill = GradientFill()
    var currentVal: Int = 50
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(size: SliderSize, origin: CGPoint){
        self.init(frame: CGRect.zero)
        switch size {
        case .Small:
            frameHeightConstant = 300.0 + (frameWidthConstant * 2)
        case .Medium:
            frameHeightConstant = 400.0 + (frameWidthConstant * 2)
        case .Large:
            frameHeightConstant = 500.0 + (frameWidthConstant * 2)
        }
        
        let distanceBetweenPlaceholderAndPoint: CGFloat = 20.0
        lowScrollableRange = frameWidthConstant + distanceBetweenPlaceholderAndPoint - frameHeightConstant / 111
        highScrollableRange = frameHeightConstant - frameWidthConstant
        scrollUnit = (highScrollableRange - lowScrollableRange) / 100
        offset = (frameWidthConstant + distanceBetweenPlaceholderAndPoint) / scrollUnit
        customInit()
    }
    
    private func customInit(){
        setFrame()
        setFrameContraints()
        setupPanGesture()
        setupTapGesture()
                //setPosImageFrameContraints()
        //setNegImageFrameContraints()
    }
    
    private func setupPanGesture(){
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(VerticalSlider.isSliding(sender:)))
        addGestureRecognizer(gesture)
    }
    
    private func setupTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(VerticalSlider.tapped(sender:)))
        addGestureRecognizer(gesture)
    }
    
    public func updateValue(forGesture gesture: UIGestureRecognizer) {
        print("update value: \(frame.origin.y)")
        let location = gesture.location(in: self).y
        if location <= highScrollableRange && location >= lowScrollableRange{
            gradientFill.reDrawGradients(forCurrentPoint: location)
            currentVal = Int(abs((gradientFill.currentPoint / scrollUnit - offset) - 100))
        }
    }

    @objc public func isSliding(sender: UIPanGestureRecognizer) {
        updateValue(forGesture: sender)
    }
    
    @objc public func tapped(sender: UITapGestureRecognizer) {
        updateValue(forGesture: sender)
    }
}

extension VerticalSlider {
    
    private func setFrame(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
        let frame = CGRect(x: 0, y: 0, width: frameWidthConstant, height: frameHeightConstant)
        gradientFill.initialSetup(withFrame: frame)
        layer.addSublayer(gradientFill)
        layoutIfNeeded()
        layoutSubviews()
    }
    
    private func setFrameContraints(){
        let width = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: frameWidthConstant)
        let height = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: frameHeightConstant!)
        width.isActive = true
        height.isActive = true
    }
    
//    private func setPosImageFrameContraints(){
//        let trailing = NSLayoutConstraint(item: plusImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)
//        let leading = NSLayoutConstraint(item: plusImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)
//        let top = NSLayoutConstraint(item: plusImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
//        let height = NSLayoutConstraint(item: plusImageView, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: frameWidthConstant)
//
//        trailing.isActive = true
//        leading.isActive = true
//        top.isActive = true
//        height.isActive = true
//
//        addSubview(plusImageView)
//        layoutIfNeeded()
//    }
//
//    private func setNegImageFrameContraints(){
//        let trailing = NSLayoutConstraint(item: negativeImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)
//        let leading = NSLayoutConstraint(item: negativeImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)
//        let top = NSLayoutConstraint(item: negativeImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
//        let height = NSLayoutConstraint(item: negativeImageView, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: frameWidthConstant)
//
//        trailing.isActive = true
//        leading.isActive = true
//        top.isActive = true
//        height.isActive = true
//
//        addSubview(negativeImageView)
//        layoutIfNeeded()
//    }
}
