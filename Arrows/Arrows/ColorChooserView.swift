//
//  ColorChooserView.swift
//  Arrows
//
//  Created by u0669056 on 2/1/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

private var _knobViewRed: KnobView? = nil
private var _knobViewGreen: KnobView? = nil
private var _knobViewBlue: KnobView? = nil


class ColorChooserView : UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        _knobViewRed = KnobView()
        _knobViewRed?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0 , height: 400.0)
        _knobViewRed?.backgroundColor = UIColor.red
        
        
        addSubview(_knobViewRed!)
        
        _knobViewBlue = KnobView()
        _knobViewBlue?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0 , height: 400.0)
        _knobViewBlue?.backgroundColor = UIColor.blue
        
        
        addSubview(_knobViewBlue!)
        
        _knobViewGreen = KnobView()
        _knobViewGreen?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0 , height: 400.0)
        _knobViewGreen?.backgroundColor = UIColor.green
        
        
        addSubview(_knobViewGreen!)

    }
    required init?(coder aDecover: NSCoder){
        fatalError()
    }
    
    var knobViewRed: KnobView? { return _knobViewRed }
    var knobViewBlue: KnobView? { return _knobViewBlue }
    var knobViewGreen: KnobView? { return _knobViewGreen }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var r: CGRect = bounds
        let width: CGFloat = r.width * 0.6
        (_knobViewRed!.frame, r) = r.divided(atDistance: width, from: .minXEdge)
        (_knobViewBlue!.frame, r) = r.divided(atDistance: width, from: .minXEdge)
        (_knobViewGreen!.frame, r) = r.divided(atDistance: width, from: .minXEdge)
        
    }
}
