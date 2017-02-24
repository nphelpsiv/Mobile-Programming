//
//  ObjectsListViewController.swift
//  Painting Studio
//
//  Created by u0669056 on 2/17/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

//THE CONTROLLER!!
class ObjectsListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, PaintingDataModelDelegate
{
    //THE VIEW!!!
    private var listView: UICollectionView{
        return view as! UICollectionView
    }
    
    var numOfCells = 25;
    
    //THE MODEL!!!
    private var paintingDataModel: PaintingDataModel = PaintingDataModel()
    
    
    
    override func loadView() {
        let collectionLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        collectionLayout.itemSize = CGSize(width: 90, height: 160)
        collectionLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        view = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionLayout)
        view.backgroundColor = UIColor.darkGray
        
    }
    
    override func viewDidLoad() {
        

        paintingDataModel.delegate = self
        
        listView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(UICollectionViewCell.self))
        
        let rightButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addNewPainting))
        
        
        self.navigationItem.rightBarButtonItem = rightButtonItem
    
        
        listView.dataSource = self
        listView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        listView.reloadData();
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paintingDataModel.numPaintings
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Get data element from indexPath
        let painting: Painting = paintingDataModel.paintingWithIndex(paintingIndex: indexPath.item)
        
        
        
        
        //Convert to a cell
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(UICollectionViewCell.self), for: indexPath)
        cell.layer.cornerRadius = 3.0
        
        //adddrawing view here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        let cellView: CellDrawingView = CellDrawingView()
        cellView.painting = painting
        cell.backgroundColor = UIColor.white
        cellView.frame = cell.bounds
        
        cell.contentView.isUserInteractionEnabled = false;

        //NSLog("Lines: " + "\(theView.painting.lines.count)")
        cell.contentView.addSubview(cellView)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        //Get Data element from index
        
        let paintingIndex: Int = indexPath.item
    
        
        //Build a view controller and give it the data needs
        let objectViewController: ObjectViewController = ObjectViewController()
        
        
        objectViewController.paintingDataModel = paintingDataModel
        objectViewController.paintingIndex = paintingIndex
        
        
        navigationController?.pushViewController(objectViewController, animated: true)
        
    }

    func collection(collection: PaintingDataModel, strokeAddedToPainting paintingIndex: Int)
    {
        listView.reloadData()
    }
    func addNewPainting()
    {
        //NSLog("Button HIT!")
        paintingDataModel.addNewPainting(painting: Painting())
        listView.reloadData()
    }
    

}
