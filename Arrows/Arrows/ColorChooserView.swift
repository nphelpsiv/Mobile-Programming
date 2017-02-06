//
//  ColorChooserView.swift
//  Arrows
//
//  Created by u0669056 on 2/1/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

private var _knobViewRed: KnobView! = nil
private var _knobViewGreen: KnobView! = nil
private var _knobViewBlue: KnobView! = nil


class ColorChooserView : UIView {
    override init(frame: CGRect){
        super.init(frame: frame)
        
//        let stackView: UIStackView = UIStackView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
//        stackView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
//        stackView.axis = UILayoutConstraintAxis.horizontal
//        stackView.distribution = UIStackViewDistribution.fillEqually
//        addSubview(stackView)

        _knobViewRed = KnobView()
        _knobViewRed?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0 , height: 400.0)
        _knobViewRed?.backgroundColor = UIColor.red
        
        _knobViewRed?.contentMode = UIViewContentMode.redraw
        _knobViewRed?.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(_knobViewRed!)
        
        _knobViewBlue = KnobView()
        _knobViewBlue?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0 , height: 400.0)
        _knobViewBlue?.backgroundColor = UIColor.blue
        
        _knobViewBlue?.translatesAutoresizingMaskIntoConstraints = false

        _knobViewBlue?.contentMode = UIViewContentMode.redraw
        addSubview(_knobViewBlue!)
        
        _knobViewGreen = KnobView()
        _knobViewGreen?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0 , height: 400.0)
        _knobViewGreen?.backgroundColor = UIColor.green
        
        _knobViewGreen?.translatesAutoresizingMaskIntoConstraints = false

        _knobViewGreen?.contentMode = UIViewContentMode.redraw
        addSubview(_knobViewGreen!)
        
        addConstraint(NSLayoutConstraint(item: _knobViewRed!, attribute: .width, relatedBy: NSLayoutRelation.equal, toItem: _knobViewGreen, attribute: .width, multiplier: 1.0, constant: 0.0))

        let views: [String:UIView] = ["red":_knobViewRed, "green":_knobViewGreen, "blue":_knobViewBlue]
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[red(>=50)]-[green(>=50)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[red]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[green]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
    }
    required init?(coder aDecover: NSCoder){
        fatalError()
    }
    
    var knobViewRed: KnobView? { return _knobViewRed }
    var knobViewBlue: KnobView? { return _knobViewBlue }
    var knobViewGreen: KnobView? { return _knobViewGreen }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        var r: CGRect = bounds
//        let width: CGFloat = r.width * 0.6
//        (_knobViewRed!.frame, r) = r.divided(atDistance: width, from: .minXEdge)
//        (_knobViewBlue!.frame, r) = r.divided(atDistance: width, from: .minXEdge)
//        (_knobViewGreen!.frame, r) = r.divided(atDistance: width, from: .minXEdge)
//        
//    }
}
