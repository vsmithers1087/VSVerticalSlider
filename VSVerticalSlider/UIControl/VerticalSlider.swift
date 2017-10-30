//
//  VerticalSlider.swift
//  VSVerticalSlider
//
//  Created by Vincent Smithers on 10/10/17.
//  Copyright © 2017 Vincent Smithers. All rights reserved.
//

import UIKit

public class VerticalSlider: UIControl {
    
    public weak var delegate: VSVerticalSliderDelegate?
    private let gradientFill = GradientFill()
    public var positiveImageView: PoleImageView?
    private var negativeImageView: PoleImageView?
    public var primaryColor = UIColor.clear
    private let frameWidth: CGFloat = 40.0
    private let placeholderHeight: CGFloat = 20.0
    private var frameHeight: CGFloat!
    private var currentVal: Int = 50

    private var minScrollPoint: CGFloat!
    private var maxScrollPoint: CGFloat!
    private var sliderOffset: CGFloat!
    private var originOffsetX: CGFloat!
    private var originOffsetY: CGFloat!
    private var scrollUnit : CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(height: CGFloat, primaryColor: UIColor, positiveImage: UIImage, negativeImage: UIImage, offsetX: CGFloat = 20, offsetY: CGFloat = 20) {
        self.init(frame: CGRect.zero)
        self.primaryColor = primaryColor
        frameHeight  = height > 200 ? height : 200
        frame.origin = CGPoint(x: 20, y: 20)
        originOffsetX = offsetX
        originOffsetY = offsetY
        setup()
        positiveImageView = setupPoleImageView(poleImage: positiveImage, isPositive: true)
        negativeImageView = setupPoleImageView(poleImage: negativeImage, isPositive: false)
    }
    
    private func setSliderContants() {
        minScrollPoint = frameWidth + placeholderHeight
        maxScrollPoint = frameHeight
        scrollUnit = (maxScrollPoint - minScrollPoint) / 100
        sliderOffset = (frameWidth + placeholderHeight) / scrollUnit
    }
    
    private func setup(){
        setSliderContants()
        setFrame()
        setFrameContraints()
        setupPanGesture()
        setupTapGesture()
        transform = CGAffineTransform(translationX: originOffsetX, y: originOffsetY)
    }
    
    private func setupPoleImageView(poleImage: UIImage, isPositive: Bool) -> PoleImageView? {
        let origin: CGPoint = isPositive ? CGPoint(x: 0, y: 0) : CGPoint(x: 0, y: frameHeight)
        let poleImageView = PoleImageView(image: poleImage)
        poleImageView.backgroundColor = UIColor.white
        poleImageView.frame = CGRect(x: origin.x, y: origin.y, width: frameWidth, height: frameWidth)
        poleImageView.layer.borderWidth = 1.0
        poleImageView.setAnimation(positive: isPositive)
        poleImageView.contentMode = .scaleAspectFit
        poleImageView.backgroundColor = UIColor.black
        addSubview(poleImageView)
        return poleImageView
    }
    
    private func setupPanGesture(){
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(VerticalSlider.slid(sender:)))
        addGestureRecognizer(gesture)
    }
    
    private func setupTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(VerticalSlider.tapped(sender:)))
        addGestureRecognizer(gesture)
    }
    
    public func setValue(_ value: Int) {
        let valueOffset = value > 75 ? -5 : 0
        let invertedHeight = (CGFloat(value + valueOffset) * ((frameHeight - frameWidth) / 100))
        let scaledHeight = ((frameHeight - invertedHeight))
        gradientFill.drawGradients(forCurrentPoint: scaledHeight)
    }
    
    public func updateValue(forGesture gesture: UIGestureRecognizer) {
        let location = gesture.location(in: self).y
        if location <= maxScrollPoint && location >= minScrollPoint{
            gradientFill.drawGradients(forCurrentPoint: location)
            currentVal = Int(abs((gradientFill.currentPoint / scrollUnit - sliderOffset) - 100))
            animatePoles(forValue: currentVal)
            delegate?.valueDidChange(value: currentVal)
            print("current value: \(currentVal)")
        }
    }
    
    private func animatePoles(forValue value: Int) {
        if value > 95 {
            positiveImageView?.propertyAnimator.startAnimation()
        }
        if value < 5 {
            negativeImageView?.propertyAnimator.startAnimation()
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
        let gradientFrame = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: frameWidth, height: frameHeight + placeholderHeight)
        gradientFill.setup(withFrame: gradientFrame, primaryColor: primaryColor)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.purple.cgColor
        layer.addSublayer(gradientFill)
        layoutIfNeeded()
        layoutSubviews()
    }
    
    private func setFrameContraints(){
        let width = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: frameWidth)
        let height = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .notAnAttribute, multiplier: 1.0, constant: frameHeight)
        width.isActive = true
        height.isActive = true
    }
}

