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
    var lines: [Stroke]
    var polyLines: [PolyLines]
    override init(frame: CGRect) {
        lines = [Stroke]()
        polyLines = [PolyLines]()
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addLine(line: Stroke)
    {
        lines.append(line)
    }
    func addPolyLine(polyline: PolyLines)
    {
        polyLines.append(polyline)
    }

}


//LINES!!
class Stroke
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
        }
    }
}


//POLYLINES!!
class PolyLines
{
    var polyPoints = [CGPoint]()
    var lineWidth: Double = 0.5
    var lineJoin: CGLineJoin = .bevel
    var lineCap: CGLineCap = .square
    var lineColor: UIColor = UIColor.white
    
    func addPolyPoint(point: CGPoint)
    {
        polyPoints.append(point)
    }
    var color: UIColor
        {
        get{
            return lineColor
        }
        set{
            lineColor = newValue
            NSLog("NEW POLY COLOR: " + "\(lineColor)")
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
            
        }
    }
}

