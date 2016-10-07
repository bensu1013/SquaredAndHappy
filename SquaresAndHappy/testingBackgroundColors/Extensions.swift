//
//  Extensions.swift
//  testingBackgroundColors
//
//  Created by Benjamin Su on 10/6/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit


extension Float {
    static func getRandomFloat(min: UInt32 = 0, max: UInt32) -> Float {
        let float = Float(arc4random_uniform(max - min) + min)
        return float / 100
    }
}

extension CGFloat {
    static func getRandomFloat(min: UInt32 = 0, max: UInt32) -> CGFloat {
        let float = CGFloat(arc4random_uniform(max - min) + min)
        return float / 100
    }
}

extension UIColor {
    class func getRandomColor(min: UInt32 = 0, max: UInt32 = 50) -> UIColor {
        let red = Float.getRandomFloat(min: min, max: max)
        let green = Float.getRandomFloat(min: min, max: max)
        let blue = Float.getRandomFloat(min: min, max: max)
        let alpha = Float.getRandomFloat(min: 40, max: 75)
        
        let color = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
        
        return color
    }
}
