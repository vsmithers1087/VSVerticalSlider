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
    
    var propertyAnimator: UIViewPropertyAnimator!
    
    public override init(image: UIImage?) {
        super.init(image: image)
        //layer.cornerRadius = frame.width / 2
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = UIColor.black
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PoleImageView {
    
    public func setAnimationFor(imageView: UIImageView) {
        propertyAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) {
            imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            imageView.center.y += 40
            imageView.layer.opacity = 0.3
        }
        
        propertyAnimator.addCompletion { _ in
            imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            imageView.center.y -= 40
            imageView.layer.opacity = 1
            self.setAnimationFor(imageView: imageView)
        }
    }
}


