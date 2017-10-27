//
//  PoleImageView.swift
//  VSVerticalSlider
//
//  Created by Vincent Smithers on 10/21/17.
//  Copyright © 2017 Vincent Smithers. All rights reserved.
//

//animate
// default images
// readme
    //- images
    //- gifs

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


