//
//  DrawingView.swift
//  Painting Studio
//
//  Created by u0669056 on 2/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

protocol DrawingDelegate: class {
    func clearUndoArr()
}

class DrawingView: UIView
{
    private var context: CGContext? = nil
    private var _painting: Painting = Painting()
    private var cellView: CellDrawingView = CellDrawingView()
    
    private var lineWidth: Double = 0.5
    private var lineJoin: CGLineJoin = .bevel
    private var lineCap: CGLineCap = .square
    private var lineColor: UIColor = UIColor.white
    private var points = [CGPoint]()

    
    private var lastSpot: CGPoint = CGPoint.zero
    var touchesBeganHit: Bool = false;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        
        context = UIGraphicsGetCurrentContext()!
        
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
            context?.setLineWidth(CGFloat(line.width))
            context?.setLineCap(line.cap)
            context?.setLineJoin(line.join)
            context?.setStrokeColor(line.color.cgColor)
            context?.drawPath(using: .stroke)
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.clearUndoArr()
        let line: Stroke = Stroke()
        line.color = lineColor
        line.cap = lineCap
        line.join = lineJoin
        line.width = lineWidth
        painting.addLine(line: line)
        
        //NSLog("TOUCHES BEGAN IN CELL POLY")
        let polyline: PolyLines = PolyLines()
        polyline.color = lineColor
        polyline.cap = lineCap
        polyline.join = lineJoin
        polyline.width = lineWidth / 2.55
        painting.addPolyLine(polyline: polyline)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        var touchPoint: CGPoint = touch.location(in: self)
        painting.lines.last?.addPoint(point: touchPoint)
        
        
        touchPoint.x = touchPoint.x / 3.55
        touchPoint.y = touchPoint.y / 3.55
        painting.polyLines.last?.addPolyPoint(point: touchPoint)
        
        setNeedsDisplay()
        cellView.setNeedsDisplay()
        
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        lastSpot = touch.location(in: self)
        
    }
    var painting: Painting {
        get{
            return _painting
        }
        set{
            _painting = newValue
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
        }
    }
    var cap: CGLineCap
        {
        get{
            return lineCap
        }
        set{
            lineCap = newValue
        }
    }
    var width: Double
        {
        get{
            return lineWidth
        }
        set{
            lineWidth = newValue
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

    weak var delegate: DrawingDelegate? = nil
}
