//
//  File.swift
//  Arrows
//
//  Created by u0669056 on 1/23/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class VectorView: UIView{
    override init(frame: CGRect){
        vectors = []
        super.init(frame: frame)
    }
    override func draw(_ rect: CGRect){
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.move(to: CGPoint(x: 20.0, y:30.0))
        for vector: Vector in vectors{
            context.addLine(to: <#T##CGPoint#>(x: CGFloat(vector.x), y: CGFloat(vector.y)))
        }
        context.drawPath(using: <#T##CGPathDrawingMode#>.stroke)\
        
        var vectors: [Vector]
            {
            didSet{
                setNeedsDisplay()
            }
        }
        
    }

}
