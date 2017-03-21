//
//  GameModel.swift
//  MVC Battleship
//
//  Created by u0669056 on 3/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import Foundation

class Game {
    
    public enum Token {
        case none
        case miss
        case hit
        case ship
    }
    
    private var _board: [[Token]] = [[.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                     [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                     [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                     [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                     [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                     [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                     [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                     [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                     [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                     [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none]]
    
    
    public var currentPlayerIs1: Bool {
        return movesTaken % 2 == 0
    }
    
    public var movesTaken: Int {
        var count = 0
        for boardCol: [Token] in _board {
            for token: Token in boardCol {
                if (token != .none) {
                    count = count + 1
                }
            }
        }
        return count
    }
    
    public var winner: Token {
        // TODO: Determine winner
        return .none
    }
    
    public var board: [[Token]] {
        return _board
    }
    
    public func takeMove(col: Int, row: Int) {
        if (_board[col][row] == .none) {
            _board[col][row] = currentPlayerIs1 ? .miss : .hit
        }
        
    }
    public func placeShip(size: Int)
    {
        var coordinates: [(col: Int, row: Int)] = []
        coordinates = getShipCoordinates(size: size)
        for coord in coordinates
        {
            _board[coord.col][coord.row] = .ship
        }
    }
    
    private func getShipCoordinates(size: Int) -> [(col: Int, row: Int)]
    {
        var coordinates: [(x: Int, y: Int)] = []
        let rand = Int(arc4random_uniform(10))
        if(rand % 2 == 0)
        {
            var count = 0
            for index in 1...size
            {
                //if not index out of bounds
                if(!(rand + index > 9))
                {
                    //if next index is not already a ship
                    if(_board[rand + index][rand] != .ship)
                    {
                        _board[rand + index][rand] = .ship
                        
                        count = count + 1
                    }
                    else
                    {
                        if(_board[rand - (index - count)][rand] != .ship)
                        {
                            _board[rand - (index - count)][rand] = .ship
                        }
                        else
                        {
                            coordinates.removeAll()
                            getShipCoordinates(size: size)
                        }

                        
                    }
                    
                }
                else
                {
                    if(_board[rand - (index - count)][rand] != .ship)
                    {
                        _board[rand - (index - count)][rand] = .ship
                    }
                    else
                    {
                        coordinates.removeAll()
                        getShipCoordinates(size: size)
                    }

                }
            }
        }
        else
        {
            var count = 0
            for index in 1...size
            {
                //if index not out of bounds
                if(!(rand + index > 9))
                {
                    if(_board[rand][rand + index] != .ship)
                    {
                        _board[rand][rand + index] = .ship
                        count = count + 1
                    }
                    else
                    {
                        _board[rand][rand  - (index - count)] = .ship
                    }
                    
                }
                else
                {
                    _board[rand][rand  - (index - count)] = .ship
                }
            }
        }
    }
    
    
}
