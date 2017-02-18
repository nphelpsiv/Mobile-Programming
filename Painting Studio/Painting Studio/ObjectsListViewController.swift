//
//  ObjectsListViewController.swift
//  Painting Studio
//
//  Created by u0669056 on 2/17/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class ObjectsListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    private var listView: UICollectionView{
        return view as! UICollectionView
    }
    
    var numOfCells = 25;
    //datamodel
    let objects: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "REALLY LONG EXAMPLE OKAY!"]
    override func loadView() {
        let collectionLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        view = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionLayout)
        
    }
    
    override func viewDidLoad() {
        
        
        listView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(UICollectionViewCell.self))
        
        listView.dataSource = self
        listView.delegate = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let object: String = objects[indexPath.item]
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(UICollectionViewCell.self), for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        
        //set cell sizes and row and columns, subclass UICollectionview cell in another class and do layout there!!
        
        
        
        let label: UILabel = cell.contentView.subviews.count == 0 ? UILabel() : cell.contentView.subviews[0] as! UILabel
        //adddrawing view here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        label.frame = CGRect(x: 0.0,y: 0.0,width: 60.0,height: 30.0)
        label.textColor = UIColor.white
        label.text = object
        label.adjustsFontSizeToFitWidth = true;
        cell.contentView.addSubview(label)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let object: String = objects[indexPath.item]
        
        let objectViewController: ObjectViewController = ObjectViewController()
        
        objectViewController.title = object
        
        objectViewController.labelView.text = object
        navigationController?.pushViewController(objectViewController, animated: true)
        
    }

}
