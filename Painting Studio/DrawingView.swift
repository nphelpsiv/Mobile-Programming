//
//  DrawingView.swift
//  Painting Studio
//
//  Created by u0669056 on 2/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class DrawingView: UIView
{
    private var context: CGContext? = nil
    //private var lineWidth2: CGFloat = 0.5
    //private var label: UILabel = UILabel()
    //private var lineCap: CGLineCap = .square
    //private var lineJoin: CGLineJoin = .bevel
    //private var strokeColor: UIColor = UIColor.white
    private var _painting: Painting = Painting()
    //var _lines: Lines = Lines()
    
    private var lineWidth: Double = 0.5
    private var lineJoin: CGLineJoin = .bevel
    private var lineCap: CGLineCap = .square
    private var lineColor: UIColor = UIColor.white
    private var points = [CGPoint]()

    
    private var lastSpot: CGPoint = CGPoint.zero
    private var touchesEnded: Bool = false;
    private var touchesBegan: Bool = false;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
                    
                }
                
            }
            //NSLog("Color in Context: " + "\(painting.color)")
            context?.setLineWidth(CGFloat(line.width))
            context?.setLineCap(line.cap)
            context?.setLineJoin(line.join)
            context?.setStrokeColor(line.color.cgColor)
            context?.drawPath(using: .stroke)
        }
        
        
        
        
        //setNeedsDisplay()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let line: Line = Line()
        line.color = lineColor
        line.cap = lineCap
        line.join = lineJoin
        line.width = lineWidth
        painting.addLine(line: line)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        var touchPoint: CGPoint = touch.location(in: self)
        //NSLog("x: \(touchPoint.x) y: \(touchPoint.y)")
        
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
        
        //setNeedsDisplay()
    }
    var painting: Painting {
        get{
            return _painting
        }
        set{
            _painting = newValue
            //setNeedsDisplay()
        }
    }
    var drawContext: CGContext? {return context}
    
    var color: UIColor
        {
        get{
            return lineColor
        }
        set{
            lineColor = newValue
            NSLog("NEW COLOR: " + "\(lineColor)")
        }
    }
    var cap: CGLineCap
        {
        get{
            return lineCap
        }
        set{
            lineCap = newValue
            //NSLog("NEW COLOR: " + "\(lineColor)")
        }
    }
    var width: Double
        {
        get{
            return lineWidth
        }
        set{
            lineWidth = newValue
            //NSLog("NEW COLOR: " + "\(lineColor)")
        }
    }
    var join: CGLineJoin
        {
        get{
            return lineJoin
        }
        set{
            lineJoin = newValue
            NSLog("NEW COLOR: " + "\(lineColor)")
        }
    }


}
