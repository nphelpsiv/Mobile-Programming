//
//  AmpViewController.swift
//  Amp
//
//  Created by u0669056 on 3/1/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class AmpViewController: UIViewController {
    override func loadView() {
        view = AmpView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AMP!"
        edgesForExtendedLayout = []
        
        //ampView.volumeKnob.addTarget(self, action: #selector(volumeChanged), for: .valueChanged)
        
        //ampView.bassKnob.addTarget(self, action: #selector(bassChanged), for: .valueChanged)
        
        ampView.volumeKnob.valueChangedHandler = {
            [weak self] in
            NSLog("HEY Volume : \(self?.ampView.volumeKnob.angle)")
        }
        
        ampView.bassKnob.valueChangedHandler = {
            [weak self] in
            NSLog("HEY Bass : \(self?.ampView.bassKnob.angle)")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private var ampView: AmpView {
        return view as! AmpView
    }

}

