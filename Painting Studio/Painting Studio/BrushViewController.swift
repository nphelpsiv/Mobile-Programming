//
//  AppDelegate.swift
//  BrushChooser
//
//  Created by u0669056 on 2/6/17.
//  Copyright © 2017 u0669056. All rights reserved.
//
import UIKit
protocol BrushDelegate: class {
    func setNewColor(color: UIColor)
    func setNewWidth(width: Double)
    func setNewEndCap(endCap: CGLineCap)
    func setNewLineJoin(join: CGLineJoin)
}


class BrushViewController: UIViewController {
    
    private var mainView: MainView? = MainView(frame: UIScreen.main.bounds)
    var controller: ObjectViewController = ObjectViewController()
    var drawController: DrawingView = DrawingView()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainView?.brushView?.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
        mainView?.slideView?.getSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        mainView?.endCapButt?.getRoundButton.addTarget(self, action: #selector(roundButton), for: .touchDown)
        mainView?.endCapButt?.getbuttButton.addTarget(self, action: #selector(buttButton), for: .touchDown)
        mainView?.endCapButt?.getsquareButton.addTarget(self, action: #selector(squareButton), for: .touchDown)
        
        mainView?.buttView?.getRoundButton.addTarget(self, action: #selector(roundJoinButton), for: .touchDown)
        mainView?.buttView?.getbevelButton.addTarget(self, action: #selector(bevelButton), for: .touchDown)
        mainView?.buttView?.getMiterButton.addTarget(self, action: #selector(miterButton), for: .touchDown)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func colorChanged()
    {
        NSLog( "Changed to: \(mainView?.brushView?.getColor)")
        mainView?.drawerView?.color = (mainView?.brushView?.getColor)!
        //controller._painting?.color = (mainView?.brushView?.getColor)!
        delegate?.setNewColor(color: (mainView?.brushView?.getColor)!)
    }
    func sliderChanged(){
        NSLog(String(describing: mainView?.drawerView?.lineWidth))
        NSLog(String(describing: mainView?.slideView?.getSlider.value))
        mainView?.drawerView?.lineWidth = (CGFloat((mainView?.slideView?.getSlider.value)!))
        delegate?.setNewWidth(width: (Double(CGFloat((mainView?.slideView?.getSlider.value)!))))
        
    }
    func roundButton()
    {
        mainView?.drawerView?.endCapState = .round
        delegate?.setNewEndCap(endCap: .round)
        
    }
    func buttButton()
    {
        mainView?.drawerView?.endCapState = .butt
        delegate?.setNewEndCap(endCap: .butt)
    }
    func squareButton()
    {
        mainView?.drawerView?.endCapState = .square
        delegate?.setNewEndCap(endCap: .square)
    }
    
    func roundJoinButton()
    {
        mainView?.drawerView?.joinState = .round
        delegate?.setNewLineJoin(join: .round)
        
    }
    func bevelButton()
    {
        mainView?.drawerView?.joinState = .bevel
        delegate?.setNewLineJoin(join: .bevel)
    }
    func miterButton()
    {
        mainView?.drawerView?.joinState = .miter
        delegate?.setNewLineJoin(join: .miter)
    }
    weak var delegate: BrushDelegate? = nil
    
}
