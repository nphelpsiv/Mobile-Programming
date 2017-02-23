//
//  MainView.swift
//  BrushChooser
//
//  Created by u0669056 on 2/6/17.
//  Copyright © 2017 u0669056. All rights reserved.
//
import UIKit

class MainView: UIView
{
    private var brushColorView: BrushColorView? = nil
    private var buttonView: buttonsView? = nil
    private var sliderView: SliderView? = nil
    private var drawView: PreviewView? = nil
    private var stackView: UIStackView? = nil
    private var mainStackView: UIStackView? = nil
    private var endCapButtonView: EndCapButtonsView? = nil
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        //create main large view
        mainStackView = UIStackView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        mainStackView?.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        mainStackView?.axis = UILayoutConstraintAxis.vertical
        mainStackView?.distribution = UIStackViewDistribution.fillEqually
        //mainStackView?.spacing = 50.0;
        addSubview(mainStackView!)
        
        //create color picker view
        brushColorView = BrushColorView()
        brushColorView?.frame = CGRect(x: 0.0 , y: 0.0, width: frame.width, height: frame.height)
        
        mainStackView?.addArrangedSubview(brushColorView!)
        
        
        //create util stack view
        stackView = UIStackView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        stackView?.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        stackView?.axis = UILayoutConstraintAxis.vertical
        stackView?.distribution = UIStackViewDistribution.fillEqually
        stackView?.spacing = 5.0
        //stackView?.alignment = .firstBaseline
        mainStackView?.addArrangedSubview(stackView!)
        
        //add to util stack view
        endCapButtonView = EndCapButtonsView()
        endCapButtonView?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0, height: 0.0)
        endCapButtonView?.backgroundColor = UIColor.black
        
        stackView?.addArrangedSubview(endCapButtonView!)
        
        buttonView = buttonsView()
        buttonView?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0, height: 400.0)
        buttonView?.backgroundColor = UIColor.black
        
        stackView?.addArrangedSubview(buttonView!)
        
        sliderView = SliderView()
        sliderView?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0, height: 400.0)
        sliderView?.backgroundColor = UIColor.black
        
        stackView?.addArrangedSubview(sliderView!)
        
        drawView = PreviewView()
        drawView?.frame = CGRect(x: 10.0, y: 20.0, width: 300.0, height: 400.0)
        drawView?.backgroundColor = UIColor.black
        
        stackView?.addArrangedSubview(drawView!)
        
        //        let views: [String:UIView] = ["brush": brushColorView!, "util":stackView!]
        //
        //        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[brush(>=5)]-[util(>=5)]-|", options: NSLayoutFormatOptions(), metrics: nil, views: views))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var brushView: BrushColorView? {return brushColorView}
    var buttView: buttonsView? {return buttonView}
    var slideView: SliderView? {return sliderView}
    var drawerView: PreviewView? {return drawView}
    var endCapButt: EndCapButtonsView? {return endCapButtonView}
    
    //   override func layoutSubviews() {
    //      super.layoutSubviews()
    //
    //            var r: CGRect = bounds
    //       let heigth: CGFloat = r.height * 0.5
    //            (brushColorView!.frame, r) = r.divided(atDistance: r.height * 0.5, from: .minYEdge)
    //            (stackView!.frame, r) = r.divided(atDistance: r.height * 0.5, from: .maxYEdge)
    //        (buttonView!.frame, r) = r.divided(atDistance: r.height * 0.15, from: .minYEdge)
    //       (sliderView!.frame, r) = r.divided(atDistance: r.height * 0.15, from: .minYEdge)
    //      (drawView!.frame, r) = r.divided(atDistance: r.height * 0.15, from: .minYEdge)
    //   }
    
}
