//
//  Painting.swift
//  Painting Studio
//
//  Created by u0669056 on 2/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class Painting: UIView
{
    var lines: [Line]
    var polyLines: [PolyLines]
    var aspectRatio: Double
    var lastPoint: CGPoint
    var opacity: CGFloat
    var moved: Bool
    override init(frame: CGRect) {
        lines = [Line]()
        polyLines = [PolyLines]()
        aspectRatio = 1.0
        lastPoint = CGPoint.zero
        opacity = 1.0
        moved  = false;
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addLine(line: Line)
    {
        lines.append(line)
    }

}
class Line
{
    var lineWidth: Double = 0.5
    var lineJoin: CGLineJoin = .bevel
    var lineCap: CGLineCap = .square
    var lineColor: UIColor = UIColor.white
    var points = [CGPoint]()
    
    func addPoint(point: CGPoint)
    {
        points.append(point)
    }
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
class PolyLines
{
    var polyPoints = [CGPoint]()
    func addPolyPoint(point: CGPoint)
    {
        polyPoints.append(point)
    }
}

