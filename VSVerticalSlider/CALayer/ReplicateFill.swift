//
//  ReplicateFill.swift
//  VSVerticalSlider
//
//  Created by Vincent Smithers on 11/1/17.
//  Copyright © 2017 Vincent Smithers. All rights reserved.
//

import Foundation
import UIKit

/*
 let duration: CFTimeInterval = 1.0
 
 let shrink = CABasicAnimation(keyPath: "transform.scale")
 shrink.fromValue = 1.0
 shrink.toValue = 0.7
 shrink.duration = duration
 shrink.repeatCount = Float.infinity
 
 bar.add(shrink, forKey: nil)
 
 r.instanceDelay = duration/Double(nrDots)
 */

public class Replicatant: CAReplicatorLayer {
    
    var color: UIColor!
    
    public override init() {
        super.init()
        setUpSubLayer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubLayer() {
        let segment = CALayer()
        segment.bounds = CGRect(x: 0.0, y: 0.0, width: frame.width, height: 20)
        segment.backgroundColor = color.cgColor
        segment.borderColor = UIColor(white: 1.0, alpha: 1.0).cgColor
        segment.borderWidth = 1.0
        segment.cornerRadius = 2.0
        segment.position = CGPoint(x: 20, y: 20)
        addSublayer(segment)
        setNumberOfSubLayers(count: Int(frame.height) / 20)
    }
    
    func setNumberOfSubLayers(count: Int) {
        instanceTransform = CATransform3DMakeTranslation(0, 20, 0)
        let offsetStep = -1 / Float(count)
        instanceBlueOffset = offsetStep
        instanceGreenOffset = offsetStep
    }
}

//public class ReplicantFill {
//    
//    var positiveReplicant = Replicatant()
//    var negativeReplicant = Replicatant()
//    var color: UIColor
//    var currentPoint: CGPoint
//    
//    
//}

