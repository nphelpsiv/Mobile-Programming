//
//  GameView.swift
//  MVC Battleship
//
//  Created by u0669056 on 3/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

protocol GameViewDelegate: class {
    func rectWithTouchedPointAt(col: Int, row: Int)
}


class GameView: UIView {
    
    private var touchSpot: CGPoint = CGPoint.zero
    private var tokenRects: [CGRect] = []
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        var gridRect: CGRect = CGRect.zero
        let dimension: CGFloat = min(bounds.width, bounds.height)
        gridRect.size.width = dimension
        gridRect.size.height = dimension
        if (bounds.width < bounds.height) { // portrait
            gridRect.origin.x = 0
            gridRect.origin.y = bounds.height * 0.5 - gridRect.size.height * 0.5
        }
        else {
            gridRect.origin.x = bounds.width * 0.5 - gridRect.size.width * 0.5
            gridRect.origin.y = 0
        }
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.addRect(gridRect)
        context.setFillColor(UIColor.white.cgColor)
        context.drawPath(using: .fill)
        
        
        
        // draw grid lines
        
        //vertical lines
        for index in 1...10
        {
            context.move(to: CGPoint(x: gridRect.minX + gridRect.width * CGFloat(0.1*Double(index)), y: gridRect.minY))
            context.addLine(to: CGPoint(x: gridRect.minX + gridRect.width * CGFloat(0.1*Double(index)), y: gridRect.maxY))
        }
        
        
        // horizontal lines
        for index in 1...10
        {
            context.move(to: CGPoint(x: gridRect.minX, y: gridRect.minY + gridRect.height * CGFloat(0.1*Double(index))))
            context.addLine(to: CGPoint(x: gridRect.maxX, y: gridRect.minY + gridRect.height * CGFloat(0.1*Double(index))))
        }

        
        context.setLineWidth(dimension * 0.01)
        context.setStrokeColor(UIColor.black.cgColor)
        context.drawPath(using: .stroke)
        
        
        // Draw game tokens
        tokenRects.removeAll()
        for tokenIndex: Int in 0 ..< min(99, tokens.count) {
            let token: NSString = tokens[tokenIndex] as NSString
            let tokenCol: Int = tokenIndex % 10
            let tokenRow: Int = tokenIndex / 10
            
            var tokenRect: CGRect = CGRect.zero
            tokenRect.size.width = gridRect.width * 0.1
            tokenRect.size.height = gridRect.height * 0.1
            tokenRect.origin.x = gridRect.minX + tokenRect.width * CGFloat(tokenCol)
            tokenRect.origin.y = gridRect.minY + tokenRect.height * CGFloat(tokenRow)
            
            let tokenTextAttributes: [String:Any] = [NSFontAttributeName:UIFont.boldSystemFont(ofSize: tokenRect.width * 0.3)]
            let tokenSize: CGSize = token.size(attributes: tokenTextAttributes)
            tokenRects.append(tokenRect)
            token.draw(at: CGPoint(x: tokenRect.midX - tokenSize.width * 0.5, y: tokenRect.midY - tokenSize.height * 0.5), withAttributes: tokenTextAttributes)
        }
    }
    
    
    public var tokens: [String] = ["none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
                                   "none", "none", "none", "none", "none", "none", "none", "none", "none", "none"
                                   ]{
        didSet {
            NSLog("Did set tokens")
            setNeedsDisplay()
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        touchSpot = touch.location(in: self)
        var i = 0
        for rect in tokenRects
        {
            if(rect.contains(touchSpot))
            {
                let tokenCol: Int = i % 10
                let tokenRow: Int = i / 10
                delegate?.rectWithTouchedPointAt(col: tokenCol, row: tokenRow)
                NSLog("In View: " + " Col: " + "\(tokenCol)" + " Row: " + "\(tokenRow)")
            }
            i = i + 1;
        }
    }
    weak var delegate: GameViewDelegate? = nil
}
