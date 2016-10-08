//
//  Blobs.swift
//  testingBackgroundColors
//
//  Created by Benjamin Su on 10/6/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//

import Foundation
import UIKit


class Blob: UIView {
    
    var avoidingTouch = false
    var boundOfView = CGRect()
    var touch: CGPoint?
    
    func setToGo(bound: CGRect) {
        self.backgroundColor = UIColor.getRandomColor()
        self.boundOfView = bound
    }
    
    func startMeandering() {
        let meander = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(meandering), userInfo: nil, repeats: true)
        meander.fire()
    }
    
    func meandering(_: Int = 0, min: UInt32 = 30, max: UInt32 = 70) {
        
        let time = Double(arc4random_uniform(200)) / 100 + 2.0
        
        var x = CGFloat(arc4random_uniform(60))
        var y = CGFloat(arc4random_uniform(60))
        
        UIView.animate(withDuration: time, delay: 0.0, options: .curveEaseInOut, animations: {
            
            self.backgroundColor = UIColor.getRandomColor(min: min, max: max)
            
            self.transform = CGAffineTransform.init(scaleX: CGFloat.getRandomFloat(min: 50, max: 150),
                                                    y: CGFloat.getRandomFloat(min: 50, max: 150))
            if let pointOfTouch = self.touch {
    
                let i = pointOfTouch.x - self.center.x
                let j = pointOfTouch.y - self.center.y
                
                self.center.x -= i * 1.5
                self.center.y -= j * 1.5
                
            } else {
                if self.boundOfView.contains(self.center) {
                    
                    switch arc4random_uniform(4) {
                    case 0:
                        x *= -1
                    case 1:
                        y *= -1
                    case 2:
                        x *= -1
                        y *= -1
                    default:
                        break
                    }
                    
                    self.center.x += x
                    self.center.y += y
                } else {
                    let viewCenter = CGPoint(x: self.boundOfView.width*0.5, y: self.boundOfView.height*0.5)
                    
                    let i = viewCenter.x - self.center.x
                    let j = viewCenter.y - self.center.y
                    
                    self.center.x += i * 0.25
                    self.center.y += j * 0.25
                }
            }
            
        })
    }
}
