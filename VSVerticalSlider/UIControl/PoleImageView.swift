//
//  PoleImageView.swift
//  VSVerticalSlider
//
//  Created by Vincent Smithers on 10/21/17.
//  Copyright © 2017 Vincent Smithers. All rights reserved.
//

// default images

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
        // custom stackview
        // unit tests
        //

    // SUBMIT TO BOHEMOTH RESOURCE REPO

import UIKit

public class PoleImageView: UIImageView {
    
    public var propertyAnimator: UIViewPropertyAnimator!
    
    public override init(image: UIImage?) {
        super.init(image: image)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PoleImageView {
    
    public func setAnimation(positive: Bool) {
        let offsetY: CGFloat = positive ? 8 : -8
        propertyAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .easeOut) {
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.center.y -= offsetY
            self.layer.opacity = 0.3
        }
        
        propertyAnimator.addCompletion { _ in
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.center.y += offsetY
            self.layer.opacity = 1
            self.setAnimation(positive: positive)
        }
    }
}



