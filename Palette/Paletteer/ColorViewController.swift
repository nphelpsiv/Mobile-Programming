//
//  ColorViewController.swift
//  Paletteer
//
//  Created by u0669056 on 2/15/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController
{
    override func loadView() {
        view = UILabel()
        
    }
    
    private var labelView: UILabel{
        return view as! UILabel
    }
    override func viewDidLoad() {
        labelView.textAlignment = NSTextAlignment.center
        labelView.font = UIFont.systemFont(ofSize: 30.0)
        
    }
    
    var color: UIColor = UIColor.black{
        didSet{
            var red: CGFloat = 0.0
            var green: CGFloat = 0.0
            var blue: CGFloat = 0.0
            color.getRed(&red, green: &green, blue: &blue, alpha: nil)
            
            labelView.text = String.localizedStringWithFormat("#%02X%02X%02X", red * 255.0, green * 255.0, blue * 255.0)
            labelView.backgroundColor = color
            labelView.textColor = UIColor.black
        }
    }
    
}
