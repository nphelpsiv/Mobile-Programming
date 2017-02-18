//
//  ObjectViewController.swift
//  Painting Studio
//
//  Created by u0669056 on 2/17/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class ObjectViewController: UIViewController{
    var labelView: UILabel{
        return view as! UILabel
    }
    
    override func loadView() {
        view = UILabel()
    }
    override func viewDidLoad() {
        labelView.backgroundColor = UIColor.white
        labelView.textAlignment = .center
        labelView.numberOfLines = -1
    }
}
