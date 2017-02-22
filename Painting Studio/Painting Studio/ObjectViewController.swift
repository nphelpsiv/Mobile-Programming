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
    public var wasDeleted: Bool = false;
    public var hitBackButton: Bool = false;
    private var context: CGContext? = nil
    var undoArr = [Lines]()
    var buttons = [UIBarButtonItem]()
    
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
    
//    var labelView: UILabel{
//        return view as! UILabel
//    }
    
    var theView: DrawingView{
        return view as! DrawingView
    }
    var painting: Painting? {
        didSet{
            //TODO: load painting into view, what goes in line 65 in objects list view
            //view = painting;
            
        }
    }
    
    override func loadView() {
        //not label in future, should be pic view
        //view = UILabel()
        view = DrawingView();
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        theView.backgroundColor = UIColor.lightGray
        
//        labelView.textAlignment = .center
//        labelView.numberOfLines = -1
        
        //UIGraphicsBeginImageContext(view.frame.size)
        
        
        
        let rightButtonItem = UIBarButtonItem.init(barButtonSystemItem: .trash ,target: self, action: #selector(deletePainting))
        //self.navigationItem.rightBarButtonItem = rightButtonItem
        buttons.append(rightButtonItem)
        
        let redoButtonItem = UIBarButtonItem.init(barButtonSystemItem: .redo ,target: self, action: #selector(redo))
        self.navigationItem.rightBarButtonItem = redoButtonItem
        buttons.append(redoButtonItem)
        let undoButtonItem = UIBarButtonItem.init(barButtonSystemItem: .undo ,target: self, action: #selector(undo))
        buttons.append(undoButtonItem)
        
        self.navigationItem.setRightBarButtonItems(buttons, animated: true)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(_paintingDataModel == nil || _paintingIndex == nil){
            return
        }
        
        //objectViewController.painting = painting;
        let painting: Painting = _paintingDataModel!.paintingWithIndex(paintingIndex: paintingIndex!)
        theView.painting = painting
        //NSLog("Painting! " + "\(painting)")
        
        //NSLog("First Point: " + "\(painting.points.first)")
        //labelView.text = "This is a paint with \(painting.strokes.count) strokes"
    }
    func deletePainting()
    {
        paintingDataModel?.removePaintingAtIndex(paintIndex: self._paintingIndex!)
        _ = navigationController?.popViewController(animated: true)
        wasDeleted = true;
        
    }
    func undo()
    {
        NSLog("UNDO!")
        let painting: Painting = _paintingDataModel!.paintingWithIndex(paintingIndex: paintingIndex!)
        if(!painting.lines.isEmpty)
        {
            var undoLine = painting.lines.popLast()
            undoArr.append(undoLine!);
            view.setNeedsDisplay()
        }
        
    }
    func redo()
    {
        NSLog("Redo!!")
        let painting: Painting = _paintingDataModel!.paintingWithIndex(paintingIndex: paintingIndex!)
        if(!undoArr.isEmpty)
        {
            painting.addLine(line: undoArr.popLast()!)
            view.setNeedsDisplay()
        }
    }
    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)
        if parent == nil{
            hitBackButton = true;
            parent?.setNeedsFocusUpdate()
        }
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
