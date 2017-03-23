//
//  PlayerChangeViewController.swift
//  MVC Battleship
//
//  Created by u0669056 on 3/22/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class PlayerChangeViewController: UIViewController
{
    private var labelView: UILabel{
        return view as! UILabel
    }
    override func loadView() {
        view = UILabel()
    }
    override func viewDidLoad() {
        labelView.textAlignment = NSTextAlignment.center
        labelView.font = UIFont.systemFont(ofSize: 15.0)
        labelView.text = "Give the device to your enemy!"
        labelView.backgroundColor = UIColor.white
        labelView.textColor = UIColor.black

    }
    
}
