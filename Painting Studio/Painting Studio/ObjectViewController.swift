//
//  ObjectViewController.swift
//  Painting Studio
//
//  Created by u0669056 on 2/17/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class ObjectViewController: UIViewController{
    private var _paintingDataModel: PaintingDataModel?
    private var _paintingIndex: Int? = nil
    
    var paintingDataModel: PaintingDataModel?
    {
        get{
            return _paintingDataModel
        }
        set{
            _paintingDataModel = newValue
        }
    }
    var paintingIndex: Int?{
        get{
            return _paintingIndex
        }
        set{
            _paintingIndex = newValue
        }
    }
    
    var labelView: UILabel{
        return view as! UILabel
    }
    
    var painting: Painting? {
        didSet{
            //TODO: load painting into view, what goes in line 65 in objects list view
        }
    }
    
    override func loadView() {
        //not label in future, should be pic view
        view = UILabel()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        labelView.backgroundColor = UIColor.white
        labelView.textAlignment = .center
        labelView.numberOfLines = -1
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(_paintingDataModel == nil || _paintingIndex == nil){
            return
        }
        
        //objectViewController.painting = painting;
        let painting: Painting = _paintingDataModel!.paintingWithIndex(paintingIndex: paintingIndex!)
        labelView.text = "This is a paint with \(painting.strokes.count) strokes"
    }
//    private func strokeToPolyLine(stroke: Stroke) -> PolyLine
//    {
//        //stroke has color, line cap etc, comes from brush chooser
//        for point: Point in stroke.points
//        {
//            //convertting from 0 -> 1 coord system to paintingView bounds. width and height
//            let polyLinePoint: CGPoint = CGPoint.zero
//            polyLinePoint.x = point.x * paintingView.bounds.width
//            polyLinePoint.y = point.y * paintingView.bounds.height
//        }
//        return nil;
//        
//    }
//    private func strokeToPolyLine(stroke: PaintingDataModel.Stroke) -> PaintingView.Stroke
//    {
//        
//    }
}
