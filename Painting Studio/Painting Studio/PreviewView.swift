//
//  DrawingView.swift
//  BrushChooser
//
//  Created by u0669056 on 2/6/17.
//  Copyright © 2017 u0669056. All rights reserved.
//
import UIKit

class PreviewView: UIControl
{
    private var context: CGContext? = nil
    private var lineWidth2: CGFloat = 0.5
    private var label: UILabel = UILabel()
    private var lineCap: CGLineCap = .square
    private var lineJoin: CGLineJoin = .bevel
    private var strokeColor: UIColor = UIColor.white
    override func draw(_ rect: CGRect) {
        
        context = UIGraphicsGetCurrentContext()!
        context?.setFillColor(UIColor.lightGray.cgColor)
        context?.setLineWidth(CGFloat(lineWidth2))
        context?.setLineCap(lineCap)
        context?.setLineJoin(lineJoin)
        context?.move(to: CGPoint(x: 20.0, y: 15.0))
        context?.addLine(to: CGPoint(x: 200.0, y: 30.0))
        context?.addLine(to: CGPoint(x: 175.0, y: 40.0))
        context?.addLine(to: CGPoint(x: 200.0, y: 55.0))
        context?.addLine(to: CGPoint(x: 300.0, y: 55.0))
        context?.addLine(to: CGPoint(x: 300.0, y: 30.0))
        context?.setStrokeColor(strokeColor.cgColor)
        context?.drawPath(using: .stroke)
        
    }
    
    var drawContext: CGContext? {return context}
    var lineWidth: CGFloat {
        get{
            return lineWidth2
        }
        set{
            lineWidth2 = newValue
            setNeedsDisplay()
        }
    }
    var endCapState: CGLineCap {
        get{
            return lineCap
        }
        set{
            lineCap = newValue
            setNeedsDisplay()
        }
    }
    var joinState: CGLineJoin {
        get{
            return lineJoin
        }
        set{
            lineJoin = newValue
            setNeedsDisplay()
        }
    }
    var color: UIColor
        {
        get{
            return strokeColor
        }
        set{
            strokeColor = newValue
            setNeedsDisplay()
        }
    }
    
}
