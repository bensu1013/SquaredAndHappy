//
//  ViewController.swift
//  testingBackgroundColors
//
//  Created by Benjamin Su on 10/6/16.
//  Copyright © 2016 Benjamin Su. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    var onlyButton: UIButton = UIButton()
    
    var colorView: UIView = UIView()
    
    var blobs: [Blob] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.frame = self.view.frame
        colorView.isUserInteractionEnabled = false
        self.view.addSubview(colorView)
        let frameSize = self.view.frame.size
        for i in 0...47 {
            let blob = Blob()
            let xMod = CGFloat(i % 4) * 0.2
            let yMod = CGFloat(i / 4) * 0.07
            
            blob.frame = CGRect(x: frameSize.width * xMod,
                                y: frameSize.height * yMod,
                                width: frameSize.width*0.5*CGFloat.getRandomFloat(min: 50, max: 100),
                                height: frameSize.width*0.5*CGFloat.getRandomFloat(min: 50, max: 100))
            blob.setToGo(bound: self.view.frame)
            blob.isUserInteractionEnabled = false
            blob.startMeandering()
            blobs.append(blob)
            self.view.addSubview(blob)
            
        }
        
        let backView = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(shiftBackgroundColor), userInfo: nil, repeats: true)
        backView.fire()
        
        //        onlyButton.frame = CGRect(x: frameSize.width*0.4, y: frameSize.height*0.45, width: frameSize.width*0.2, height: frameSize.height*0.1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            updateBlobTouchPoint(touch: touch.location(in: self.view))
            print(touch.location(in: nil))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            updateBlobTouchPoint(touch: touch.location(in: self.view))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateBlobTouchPoint(touch: nil)
    }
    
    
    
    func shiftBackgroundColor() {
        UIView.animate(withDuration: 2.0, animations: {
            self.colorView.backgroundColor = UIColor.getRandomColor(min: 70, max: 100)
        })
    }
    
    func updateBlobTouchPoint(touch: CGPoint?) {
        if let touch = touch {
            for blob in blobs {
                if blob.frame.contains(touch) {
                    blob.touch = touch
                    blob.meandering(min: 70, max: 100)
                } else {
                    blob.touch = nil
                }
            }
        }
        
    }
    
    
    
    
    
}









