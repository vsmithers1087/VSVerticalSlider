//
//  PoleImageView.swift
//  VSVerticalSlider
//
//  Created by Vincent Smithers on 10/21/17.
//  Copyright © 2017 Vincent Smithers. All rights reserved.
//

// No Images Draw On Custom View

// readme
    // description / about
        // animation gif
        
    // quickstart
        // with playground
        // sample project

    // Add to Project
        // setup with pods
        // setup with carthage
        // setup with storyboard
        // images
        // setup programatically
        // conforming to protocol
        // delegate methods / set slider value
            // gif

    // todo check list
        // Slider Panel: custom stackview with multiple slider
        // unit tests
        // Image Assets

    // SUBMIT TO BOHEMOTH RESOURCE REPO

public enum ArrowDirection {
    case up
    case down
}

import UIKit

public class ArrowView: UIView {
    
    public var propertyAnimator: UIViewPropertyAnimator!
    public var direction: ArrowDirection!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(frame: CGRect, direction: ArrowDirection) {
        self.init(frame: frame)
        self.direction = direction
        layer.borderWidth = 1.0
        setAnimation()
    }

}

extension ArrowView {
    
    public func setAnimation() {
        let offsetY: CGFloat = direction == .up ? 8 : -8
        propertyAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.center.y -= offsetY
            self.layer.opacity = 0.3
        }
        
        propertyAnimator.addCompletion { _ in
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.center.y += offsetY
            self.layer.opacity = 1
            self.setAnimation()
        }
    }
}



