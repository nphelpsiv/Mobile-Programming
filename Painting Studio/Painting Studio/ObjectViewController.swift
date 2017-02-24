//
//  ObjectViewController.swift
//  Painting Studio
//
//  Created by u0669056 on 2/17/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class ObjectViewController: UIViewController, BrushDelegate, DrawingDelegate {
    private var _paintingDataModel: PaintingDataModel?
    private var _paintingIndex: Int? = nil
    public var wasDeleted: Bool = false;
    public var hitBackButton: Bool = false;
    private var context: CGContext? = nil
    var undoArr = [Stroke]()
    var undoArrPoly = [PolyLines]()
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
    var cellView: CellDrawingView = CellDrawingView()
    var _painting: Painting?

    
    override func loadView() {
        view = DrawingView();
        theView.delegate = self
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        theView.backgroundColor = UIColor.black
        
        
        let rightButtonItem = UIBarButtonItem.init(barButtonSystemItem: .trash ,target: self, action: #selector(deletePainting))
        buttons.append(rightButtonItem)
        
        let redoButtonItem = UIBarButtonItem.init(barButtonSystemItem: .redo ,target: self, action: #selector(redo))
        self.navigationItem.rightBarButtonItem = redoButtonItem
        buttons.append(redoButtonItem)
        let undoButtonItem = UIBarButtonItem.init(barButtonSystemItem: .undo ,target: self, action: #selector(undo))
        buttons.append(undoButtonItem)
        
        let settingsButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit ,target: self, action: #selector(settings))

        buttons.append(settingsButtonItem)
        
        self.navigationItem.setRightBarButtonItems(buttons, animated: true)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        if(_paintingDataModel == nil || _paintingIndex == nil){
            return
        }
        
        let painting: Painting = _paintingDataModel!.paintingWithIndex(paintingIndex: paintingIndex!)
        _painting = painting
        theView.painting = painting
    }
    func deletePainting()
    {
        paintingDataModel?.removePaintingAtIndex(paintIndex: self._paintingIndex!)
        _ = navigationController?.popViewController(animated: true)
        wasDeleted = true;
        
    }
    func undo()
    {
        let painting: Painting = _paintingDataModel!.paintingWithIndex(paintingIndex: paintingIndex!)
        if(!painting.lines.isEmpty)
        {
            var undoLine = painting.lines.popLast()
            undoArr.append(undoLine!);
            view.setNeedsDisplay()
            
            
            var undoLinePoly = painting.polyLines.popLast()
            undoArrPoly.append(undoLinePoly!);
            cellView.setNeedsDisplay()
        }
        
    }
    func redo()
    {
        let painting: Painting = _paintingDataModel!.paintingWithIndex(paintingIndex: paintingIndex!)
        if(!undoArr.isEmpty)
        {
            painting.addLine(line: undoArr.popLast()!)
            view.setNeedsDisplay()
            
            painting.addPolyLine(polyline: undoArrPoly.popLast()!)
            cellView.setNeedsDisplay()
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
    func clearUndoArr() {
        undoArr.removeAll()
    }
    
    
    func setNewColor(color: UIColor){
        theView.color = color
        
    }
    func setNewWidth(width: Double){
        theView.width = width
        
    }
    func setNewEndCap(endCap: CGLineCap){
        theView.cap = endCap
    }
    func setNewLineJoin(join: CGLineJoin){
        theView.join = join
    }
    

}
