//
//  AmpView.swift
//  Amp
//
//  Created by u0669056 on 3/1/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class AmpView: UIView
{
    private var _volumeKnob: KnobView! = nil
    private var _bassKnob: KnobView! = nil
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        let knobStackView: UIStackView = UIStackView(frame: bounds)
        knobStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        knobStackView.axis = .horizontal
        knobStackView.distribution = .fillEqually
        addSubview(knobStackView)
        
        
        _volumeKnob = KnobView()
        _volumeKnob.backgroundColor = UIColor.clear
        knobStackView.addArrangedSubview(_volumeKnob)
        
        _bassKnob = KnobView()
        _bassKnob.backgroundColor = UIColor.clear
        knobStackView.addArrangedSubview(_bassKnob)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var volumeKnob: KnobView
    {
        return _volumeKnob
    }
    var bassKnob: KnobView
    {
        return _bassKnob
    }
}
