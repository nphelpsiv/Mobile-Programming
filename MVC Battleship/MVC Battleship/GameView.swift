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
    func toast(toast: String)
}


class GameView: UIView {
    
    private var touchSpot: CGPoint = CGPoint.zero
    private var tokenRects: [CGRect] = []
    private var tokenDefendRects: [CGRect] = []
    private var touched: Bool = false
    private var touchedColGlobal: Int = 0
    private var touchedRowGlobal: Int = 0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        var gridRect: CGRect = CGRect.zero
        let dimension: CGFloat = min(bounds.width/1.5, bounds.height/1.5)
        gridRect.size.width = dimension
        gridRect.size.height = dimension
        if (bounds.width < bounds.height) { // portrait
            gridRect.origin.x = 50
            gridRect.origin.y = bounds.height * 0.93 - gridRect.size.height * 0.93
        }
        else {
            gridRect.origin.x = bounds.width * 0.3 - gridRect.size.width * 0.3
            gridRect.origin.y = 50
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
        
        
        // Draw game for lower attack board tokens
        tokenRects.removeAll()
        for tokenIndex: Int in 0 ..< min(100, tokens.count) {
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
            if(token != "\u{1F6A2}")
            {
                token.draw(at: CGPoint(x: tokenRect.midX - tokenSize.width * 0.5, y: tokenRect.midY - tokenSize.height * 0.5), withAttributes: tokenTextAttributes)
            }
            
            
            
            //checks after clicking
            NSLog("LocalTokenCol: " + "\(tokenCol)" + " LocalTokenRow: " + "\(tokenRow)" + " GlobalTokenCol: " + "\(touchedColGlobal)" + " GlobalTokenRow: " + "\(touchedRowGlobal)")
            NSLog("TOKEN: " + "\(token)")
            if(touched == true && token == "\u{2705}" && tokenCol == touchedColGlobal && tokenRow == touchedRowGlobal)
            {
                delegate?.toast(toast: "Hit!")
                touched = false
            }
            else if(touched == true && token == "\u{274C}" && tokenCol == touchedColGlobal && tokenRow == touchedRowGlobal)
            {
                delegate?.toast(toast: "Miss!")
                touched = false
            }
            
        }
        
//        case .hit : viewTokens.append("\u{2705}")
//        case .miss : viewTokens.append("\u{274C}")
//        case .ship  : viewTokens.append("\u{1F6A2}")
        
        
        
        
        
        
        
        //draw defend top board with ships and what enemy has done
        var gridRectDefend: CGRect = CGRect.zero
        let dimensionDefend: CGFloat = min(bounds.width/1.5, bounds.height/1.5)
        gridRectDefend.size.width = dimensionDefend
        gridRectDefend.size.height = dimensionDefend
        if (bounds.width < bounds.height) { // portrait
            gridRectDefend.origin.x = 50
            gridRectDefend.origin.y = bounds.height * 0.08 - gridRectDefend.size.height * 0.08
        }
        else {
            gridRectDefend.origin.x = bounds.width * 0.7 - gridRectDefend.size.width * 0.7
            gridRectDefend.origin.y = 50
        }
        
        let contextDefend: CGContext = UIGraphicsGetCurrentContext()!
        contextDefend.addRect(gridRectDefend)
        contextDefend.setFillColor(UIColor.darkGray.cgColor)
        contextDefend.drawPath(using: .fill)
        
        
        
        // draw grid lines
        
        //vertical lines
        for index in 1...10
        {
            contextDefend.move(to: CGPoint(x: gridRectDefend.minX + gridRectDefend.width * CGFloat(0.1*Double(index)), y: gridRectDefend.minY))
            contextDefend.addLine(to: CGPoint(x: gridRectDefend.minX + gridRectDefend.width * CGFloat(0.1*Double(index)), y: gridRectDefend.maxY))
        }
        
        
        // horizontal lines
        for index in 1...10
        {
            contextDefend.move(to: CGPoint(x: gridRectDefend.minX, y: gridRectDefend.minY + gridRectDefend.height * CGFloat(0.1*Double(index))))
            contextDefend.addLine(to: CGPoint(x: gridRectDefend.maxX, y: gridRectDefend.minY + gridRectDefend.height * CGFloat(0.1*Double(index))))
        }
        
        
        contextDefend.setLineWidth(dimensionDefend * 0.01)
        contextDefend.setStrokeColor(UIColor.black.cgColor)
        contextDefend.drawPath(using: .stroke)
        
        
        // Draw game for lower attack board tokens
        tokenDefendRects.removeAll()
        for tokenIndex: Int in 0 ..< min(100, tokensDefend.count) {
            let token: NSString = tokensDefend[tokenIndex] as NSString
            let tokenCol: Int = tokenIndex % 10
            let tokenRow: Int = tokenIndex / 10
            
            var tokenRect: CGRect = CGRect.zero
            tokenRect.size.width = gridRectDefend.width * 0.1
            tokenRect.size.height = gridRectDefend.height * 0.1
            tokenRect.origin.x = gridRectDefend.minX + tokenRect.width * CGFloat(tokenCol)
            tokenRect.origin.y = gridRectDefend.minY + tokenRect.height * CGFloat(tokenRow)
            let tokenTextAttributes: [String:Any] = [NSFontAttributeName:UIFont.boldSystemFont(ofSize: tokenRect.width * 0.3)]
            let tokenSize: CGSize = token.size(attributes: tokenTextAttributes)
            tokenDefendRects.append(tokenRect)
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
    public var tokensDefend: [String] = ["none", "none", "none", "none", "none", "none", "none", "none", "none", "none",
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
            NSLog("Did set tokensDefend")
            setNeedsDisplay()
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        touched = true
        let touch: UITouch = touches.first!
        touchSpot = touch.location(in: self)
        var i = 0
        for rect in tokenRects
        {
            if(rect.contains(touchSpot))
            {
                let tokenCol: Int = i % 10
                let tokenRow: Int = i / 10
                touchedColGlobal = tokenCol
                touchedRowGlobal = tokenRow
                delegate?.rectWithTouchedPointAt(col: tokenCol, row: tokenRow)
                //NSLog("In View: " + " Col: " + "\(tokenCol)" + " Row: " + "\(tokenRow)")
            }
            i = i + 1;
        }

        
    }
    weak var delegate: GameViewDelegate? = nil
}
