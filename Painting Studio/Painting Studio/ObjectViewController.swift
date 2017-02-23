//
//  ObjectViewController.swift
//  Painting Studio
//
//  Created by u0669056 on 2/17/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class ObjectViewController: UIViewController, BrushDelegate {
    private var _paintingDataModel: PaintingDataModel?
    private var _paintingIndex: Int? = nil
    public var wasDeleted: Bool = false;
    public var hitBackButton: Bool = false;
    private var context: CGContext? = nil
    var undoArr = [Line]()
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
    var theView: DrawingView{
        return view as! DrawingView
    }
    var _painting: Painting?

    
    override func loadView() {
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
        
        let settingsButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit ,target: self, action: #selector(settings))
        //self.navigationItem.rightBarButtonItem = rightButtonItem
        buttons.append(settingsButtonItem)
        
        self.navigationItem.setRightBarButtonItems(buttons, animated: true)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(_paintingDataModel == nil || _paintingIndex == nil){
            return
        }
        
        //objectViewController.painting = painting;
        let painting: Painting = _paintingDataModel!.paintingWithIndex(paintingIndex: paintingIndex!)
        _painting = painting
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
        //NSLog("UNDO!")
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
        //NSLog("Redo!!")
        let painting: Painting = _paintingDataModel!.paintingWithIndex(paintingIndex: paintingIndex!)
        if(!undoArr.isEmpty)
        {
            painting.addLine(line: undoArr.popLast()!)
            view.setNeedsDisplay()
        }
    }
    func settings()
    {
        let brushVC: BrushViewController = BrushViewController()
        brushVC.delegate = self
        navigationController?.pushViewController(brushVC, animated: true)
    }
    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController: parent)
        if parent == nil{
            hitBackButton = true;
            parent?.setNeedsFocusUpdate()
        }
    }
    
    
    
    func setNewColor(color: UIColor){
        NSLog("COLOR!!!!!")
        theView.color = color
        
    }
    func setNewWidth(width: Double){
        theView.width = width
    }
    func setNewEndCap(endCap: CGLineCap){
        //painting.lineCap = endCap
        theView.cap = endCap
    }
    func setNewLineJoin(join: CGLineJoin){
        //painting.lineJoin = join
        theView.join = join
    }
    

//    private func lineToPolyLine(line: Lines, paintingView: UIView) -> PolyLines
//    {
//        //stroke has color, line cap etc, comes from brush chooser
//        for point in line.points
//        {
//            //convertting from 0 -> 1 coord system to paintingView bounds. width and height
//            var polyLinePoint: CGPoint = CGPoint.zero
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
