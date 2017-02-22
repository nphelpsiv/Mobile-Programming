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
    //private var lineWidth2: CGFloat = 0.5
    //private var label: UILabel = UILabel()
    //private var lineCap: CGLineCap = .square
    //private var lineJoin: CGLineJoin = .bevel
    //private var strokeColor: UIColor = UIColor.white
    private var _painting: Painting = Painting()
    //var _lines: Lines = Lines()
    
    private var lastSpot: CGPoint = CGPoint.zero
    private var touchesEnded: Bool = false;
    private var touchesBegan: Bool = false;
    
    
    override func draw(_ rect: CGRect) {
        
        context = UIGraphicsGetCurrentContext()!
        
        //?.move(to: CGPoint(x: 20.0, y: 15.0))
        //context?.addLine(to: CGPoint(x: 200.0, y: 30.0))
        
        for line in painting.lines
        {
            for point in line.points
            {
                if(point.equalTo(line.points.first!)){
                    context?.move(to: point)
                }
                else{
                    context?.addLine(to: point)
                    context?.setFillColor(painting.lineColor)
                    context?.setLineWidth(CGFloat(painting.lineWidth))
                    context?.setLineCap(painting.lineCap)
                    context?.setLineJoin(painting.lineJoin)
                    context?.setStrokeColor(painting.lineColor)
                }
                
            }
        }
        
        
        
        context?.drawPath(using: .stroke)
        //setNeedsDisplay()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        painting.addLine(line: Lines())
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        var touchPoint: CGPoint = touch.location(in: self)
        NSLog("x: \(touchPoint.x) y: \(touchPoint.y)")
        
        //painting.lines.addPoint(point: touchPoint)
        painting.lines.last?.addPoint(point: touchPoint)
        setNeedsDisplay()
        //sendActions(for: .valueChanged)
        //     theta = atan2(y, x)
        
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        lastSpot = touch.location(in: self)
        NSLog("TouchENDED!" + "\(lastSpot)")
        touchesEnded = true;
        touchesBegan = false;
        
        setNeedsDisplay()
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
