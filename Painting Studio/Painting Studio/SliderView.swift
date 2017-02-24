//
//  SliderView.swift
//  BrushChooser
//
//  Created by u0669056 on 2/6/17.
//  Copyright © 2017 u0669056. All rights reserved.
//
import UIKit


class SliderView: UIView{
    private var slider: UISlider = UISlider()
    private var drawView: DrawingView? = nil
    private var label: UILabel = UILabel()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        label.text = " Adjust Width:"
        label.font = UIFont(name: "Helvetica", size: 12)
        label.textColor = UIColor.white
        label.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 15.0)
        addSubview(label)
        slider.frame = CGRect(x: 10.0 , y: 10.0, width: 295.0, height: 50.0)
        slider.minimumValue = 1.0
        slider.maximumValue = 50.0
        addSubview(slider)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var getSlider: UISlider {return slider}
}
