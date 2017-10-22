//
//  UIColor.swift
//  VSVerticalSlider
//
//  Created by Vincent Smithers on 10/22/17.
//  Copyright © 2017 Vincent Smithers. All rights reserved.
//

import UIKit

public typealias RGBValues = (r: CGFloat, g: CGFloat, b: CGFloat)

extension UIColor {
    
    public class func getRGBForColor(_ color: UIColor) -> RGBValues? {
        if let colorComponenets = color.cgColor.components {
            let values = RGBValues(r: colorComponenets[0], g: colorComponenets[1], b: colorComponenets[2])
            return values
        }
        return nil
    }
    
    public class func getCompliment(color: UIColor) -> UIColor? {
        if let rgbValues = getRGBForColor(color) {
            let compliment = UIColor.init(red: 1.0 - rgbValues.r, green: 1.0 - rgbValues.g, blue: 1.0 - rgbValues.b, alpha: 1.0)
            return compliment
        }
        return nil
    }
}
