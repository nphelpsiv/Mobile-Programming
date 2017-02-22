//
//  PaintingsDataModel.swift
//  Painting Studio
//
//  Created by u0669056 on 2/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import Foundation

protocol PaintingDataModelDelegate: class
{
    func collection(collection: PaintingDataModel, strokeAddedToPainting paintingIndex: Int)

}

class PaintingDataModel
{
    private var paintings: [Painting] = []
    
    var numPaintings: Int{
        return paintings.count
    }
    
    func paintingWithIndex(paintingIndex: Int) -> Painting
    {
        return paintings[paintingIndex]
    }
    func removePaintingAtIndex(paintIndex: Int)
    {
        paintings.remove(at: paintIndex)
    }
    
    func addNewPainting(painting: Painting)
    {
        paintings.append(painting)
    }
//    func paintingsByUser(user: String) -> [Int]
//    {
//        
//    }
//    func addStroke(stroke: Stroke, toPainting paintingIndex: Int)
//    {
//        let painting: Painting = paintingWithIndex(paintingIndex: paintingIndex)
//        painting.strokes.append(stroke)
//        delegate?.collection(collection: self, strokeAddedToPainting: paintingIndex)
//    }
    weak var delegate: PaintingDataModelDelegate?
}

