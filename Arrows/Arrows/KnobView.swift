//
//  KnobView.swift
//  Arrows
//
//  Created by u0669056 on 1/25/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class KnobView : UIView {
    override func draw(_ rect: CGRect) {
        //TODO: What isf bounds.size.width < bounds.size.height
        let knobRect: CGRect = CGRect(x: 0.0, y: 0.0, width: bounds.size.width, height: bounds.size.width)
        
        var nibRect: CGRect = CGRect(x: knobRect.size.height / 1.2, y: knobRect.size.height/2.0, width: knobRect.width/10.0 , height: knobRect.width / 10.0)
        
        nibRect.origin.y -= nibRect.height / 2.0
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.lightGray.cgColor)
        context.addEllipse(in: knobRect)
        context.drawPath(using: .fill)
        

        context.setFillColor(UIColor.darkGray.cgColor)
        context.addEllipse(in: nibRect)
        context.drawPath(using: .fill)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)
        NSLog("x: \(touchPoint.x) y: \(touchPoint.y)")
    }
    
}
