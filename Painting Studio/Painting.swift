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
    var lines = [Lines]()
    var aspectRatio: Double = 1.0
    var lastPoint = CGPoint.zero
    var opacity: CGFloat = 1.0
    var moved  = false;
    var lineWidth = 15.0
    var lineJoin: CGLineJoin = .bevel
    var lineCap: CGLineCap = .square
    var lineColor: CGColor = UIColor.white.cgColor
    func addLine(line: Lines)
    {
        lines.append(line)
    }
}
class Lines
{
    var points = [CGPoint]()
    func addPoint(point: CGPoint)
    {
        points.append(point)
    }
}

