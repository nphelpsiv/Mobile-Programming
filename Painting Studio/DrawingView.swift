//
//  DrawingView.swift
//  Painting Studio
//
//  Created by u0669056 on 2/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class DrawingView: UIControl
{
    private var context: CGContext? = nil
    private var lineWidth2: CGFloat = 0.5
    private var label: UILabel = UILabel()
    private var lineCap: CGLineCap = .square
    private var lineJoin: CGLineJoin = .bevel
    private var strokeColor: UIColor = UIColor.white
    private var _painting: Painting = Painting()
    
    
    override func draw(_ rect: CGRect) {
        
        context = UIGraphicsGetCurrentContext()!
        context?.setFillColor(UIColor.lightGray.cgColor)
        context?.setLineWidth(CGFloat(lineWidth2))
        context?.setLineCap(lineCap)
        context?.setLineJoin(lineJoin)
        context?.move(to: CGPoint(x: 20.0, y: 15.0))
        context?.addLine(to: CGPoint(x: 200.0, y: 30.0))
        
        for point in painting.points
        {
            context?.addLine(to: point)
        }
        
        context?.setStrokeColor(strokeColor.cgColor)
        context?.drawPath(using: .stroke)
        setNeedsDisplay()
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        var touchPoint: CGPoint = touch.location(in: self)
        NSLog("x: \(touchPoint.x) y: \(touchPoint.y)")
        
        painting.addPoint(point: touchPoint)
        setNeedsDisplay()
        //sendActions(for: .valueChanged)
        //     theta = atan2(y, x)
        
        
    }
    var painting: Painting {
        get{
            return _painting
        }
        set{
            _painting = newValue
            setNeedsDisplay()
        }
    }
    var drawContext: CGContext? {return context}

}
//class Lines
//{
//    var points: [CGPoint] = []
//    func addPoint(point: CGPoint)
//    {
//        points.append(point)
//    }
//}
