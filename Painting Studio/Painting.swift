//
//  Painting.swift
//  Painting Studio
//
//  Created by u0669056 on 2/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import Foundation

class Painting
{
    var strokes: [Stroke] = []
    var aspectRatio: Double = 1.0
    
}
struct Stroke{
    var color: Color
    var lineWidth: Double
    var points: [Point]
}
struct Color
{
    var r: Double
    var g: Double
    var b: Double
}
struct Point
{
    var x: Double
    var y: Double
    
}
