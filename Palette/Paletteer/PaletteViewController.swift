//
//  PaletteViewController.swift
//  Paletteer
//
//  Created by u0669056 on 2/13/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class PaletteViewController: UIViewController, UITableViewDataSource
{
    override func loadView() {
        //TODO: set the view property
        let colorTableView: UITableView = UITableView()
        //frame: window!.rootViewController!.view.bounds
        view = colorTableView
    }
    
    override func viewDidLoad() {
        //TODO: Customize view {and subviews)
        //NOTE: view does NOT have a frame yet!!!!
        
        //colorTableView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        contentVIew.dataSource = self
    }
    
    private var contentVIew: UITableView! {return view as! UITableView}
    
//    override func viewWillAppear(_ animated: Bool) {
//        //TODO: what should happen when this view controllers view appears?
//    }
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
//        {
//            
//    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1000
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "One ring to rule them all! \(indexPath.row)"
        cell.backgroundColor = colorForIndex(index: indexPath.row)
        
        // cell.contentView.addSubview(someView)
        
        return cell
    }
    func colorForIndex(index: Int) -> UIColor
    {
        return UIColor(hue: CGFloat(index) / 100.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }

}
