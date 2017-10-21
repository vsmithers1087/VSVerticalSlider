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
    
    var gradientFill = GradientFill()
    public var value: (Int) -> () = { return $0 }
    
    var frameWidthConstant: CGFloat = 40.0
    var currentVal: Int = 50
    var frameHeightConstant: CGFloat!

    private var lowScrollableRange: CGFloat!
    private var highScrollableRange: CGFloat!
    private var offset: CGFloat!
    private var scrollUnit : CGFloat!
    private let placeholderHeight: CGFloat = 20.0
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(size: SliderSize, positiveImage: UIImage? = nil, negativeImage: UIImage? = nil){
        self.init(frame: CGRect.zero)
        switch size {
        case .Small:
            frameHeightConstant = 300.0 + (frameWidthConstant * 2)
        case .Medium:
            frameHeightConstant = 400.0 + (frameWidthConstant * 2)
        case .Large:
            frameHeightConstant = 500.0 + (frameWidthConstant * 2)
        }
        setup()
        setupPoleImageView(poleImage: positiveImage, isPositive: true)
        setupPoleImageView(poleImage: negativeImage, isPositive: false)
    }
    
    private func setSliderContants() {
        lowScrollableRange = frameWidthConstant + placeholderHeight
        highScrollableRange = frameHeightConstant
        scrollUnit = (highScrollableRange - lowScrollableRange) / 100
        offset = (frameWidthConstant + placeholderHeight) / scrollUnit
    }
    
    private func setup(){
        setSliderContants()
        setFrame()
        setFrameContraints()
        setupPanGesture()
        setupTapGesture()
    }
    
    private func setupPoleImageView(poleImage: UIImage?, isPositive: Bool) {
        let origin: CGPoint = isPositive ? CGPoint(x: 0, y: 0) : CGPoint(x: 0, y: frameHeightConstant)
        if let image = poleImage {
            let poleImageView = PoleImageView(image: image)
            poleImageView.frame = CGRect(x: origin.x, y: origin.y, width: frameWidthConstant, height: frameWidthConstant)
            addSubview(poleImageView)
        }
    }
    
    private func setupPanGesture(){
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(VerticalSlider.slid(sender:)))
        addGestureRecognizer(gesture)
    }
    
    private func setupTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(VerticalSlider.tapped(sender:)))
        addGestureRecognizer(gesture)
    }
    
    public func updateValue(forGesture gesture: UIGestureRecognizer) {
        let location = gesture.location(in: self).y
        if location <= highScrollableRange && location >= lowScrollableRange{
            gradientFill.reDrawGradients(forCurrentPoint: location)
            currentVal = Int(abs((gradientFill.currentPoint / scrollUnit - offset) - 100))
            print("current value: \(currentVal)")
            value(currentVal)
        }
    }

    @objc public func slid(sender: UIPanGestureRecognizer) {
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
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor.black.cgColor
        let frame = CGRect(x: 0, y: 0, width: frameWidthConstant, height: frameHeightConstant + placeholderHeight)
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
}
