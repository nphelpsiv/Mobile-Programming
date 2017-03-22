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
    
    private var _defendTopBoard: [[Token]] = [[.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
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
    
    
    
    init()
    {
        placeShip(size: 5, board: "Top");
        placeShip(size: 4, board: "Top");
        placeShip(size: 3, board: "Top");
        placeShip(size: 3, board: "Top");
        placeShip(size: 2, board: "Top");
        
        placeShip(size: 5, board: "Bot");
        placeShip(size: 4, board: "Bot");
        placeShip(size: 3, board: "Bot");
        placeShip(size: 3, board: "Bot");
        placeShip(size: 2, board: "Bot");
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
    public var defendTopBoard: [[Token]] {
        return _defendTopBoard
    }
    
    public func takeMove(col: Int, row: Int) {
        if (_board[col][row] == .none) {
            //_board[col][row] = currentPlayerIs1 ? .miss : .hit
            //if current player is 1
            _board[col][row] = .miss
            
        }
        else if(_board[col][row] == .ship)
        {
            _board[col][row] = .hit
        }
        
    }
    public func placeShip(size: Int, board: String)
    {
        var coordinates: [(col: Int, row: Int)] = []
        coordinates = getShipCoordinates(size: size, board: board)
        for coord in coordinates
        {
            if(board == "Top")
            {
                _defendTopBoard[coord.col][coord.row] = .ship
            }
            else if(board == "Bot")
            {
               _board[coord.col][coord.row] = .ship
            }
        }
    }
    
    private func getShipCoordinates(size: Int, board: String) -> [(col: Int, row: Int)]
    {
        if(board == "Top")
        {
            var coordinates: [(col: Int, row: Int)] = []
            let randRow = Int(arc4random_uniform(9))
            let randCol = Int(arc4random_uniform(9))
            if(randCol % 2 == 0)
            {
                for index in 0...size - 1
                {
                    //if not index out of bounds
                    if(randCol + index < 10)
                    {
                        //if next index is not already a ship
                        if(_defendTopBoard[randCol + index][randRow] == .none)
                        {
                            //_board[rand + index][rand] = .ship
                            coordinates.append((col: randCol + index, row: randRow))
                        }
                            //already ship in way try again
                        else
                        {
                            
                            //no way possible restart
                            coordinates.removeAll()
                            coordinates = getShipCoordinates(size: size, board: board)
                            return coordinates
                            
                        }
                        
                    }
                        //was out of bounds try again
                    else
                    {
                        //no way possible restart
                        coordinates.removeAll()
                        coordinates = getShipCoordinates(size: size, board: board)
                        return coordinates
                    }
                }
                return coordinates
            }
            else
            {
                for index in 0...size - 1
                {
                    //if index not out of bounds
                    if(randRow + index < 10)
                    {
                        //if next index is not already a ship
                        if(_defendTopBoard[randCol][randRow + index] == .none)
                        {
                            //_board[rand][rand + index] = .ship
                            coordinates.append((col: randCol, row: randRow + index))
                        }
                            //index was already a ship go backwards
                        else
                        {
                            
                            //no way possible restart
                            coordinates.removeAll()
                            coordinates = getShipCoordinates(size: size, board: board)
                            return coordinates
                        }
                        
                    }
                        //index was out of bounds go backwards
                    else
                    {
                        //no way possible restart
                        coordinates.removeAll()
                        coordinates = getShipCoordinates(size: size, board: board)
                        return coordinates
                    }
                }
                return coordinates
            }
        }
        else
        {
            var coordinates: [(col: Int, row: Int)] = []
            let randRow = Int(arc4random_uniform(9))
            let randCol = Int(arc4random_uniform(9))
            if(randCol % 2 == 0)
            {
                for index in 0...size - 1
                {
                    //if not index out of bounds
                    if(randCol + index < 10)
                    {
                        //if next index is not already a ship
                        if(_board[randCol + index][randRow] == .none)
                        {
                            //_board[rand + index][rand] = .ship
                            coordinates.append((col: randCol + index, row: randRow))
                        }
                            //already ship in way try again
                        else
                        {
                            
                            //no way possible restart
                            coordinates.removeAll()
                            coordinates = getShipCoordinates(size: size, board: board)
                            return coordinates
                            
                        }
                        
                    }
                        //was out of bounds try again
                    else
                    {
                        //no way possible restart
                        coordinates.removeAll()
                        coordinates = getShipCoordinates(size: size, board: board)
                        return coordinates
                    }
                }
                return coordinates
            }
            else
            {
                for index in 0...size - 1
                {
                    //if index not out of bounds
                    if(randRow + index < 10)
                    {
                        //if next index is not already a ship
                        if(_board[randCol][randRow + index] == .none)
                        {
                            //_board[rand][rand + index] = .ship
                            coordinates.append((col: randCol, row: randRow + index))
                        }
                            //index was already a ship go backwards
                        else
                        {
                            
                            //no way possible restart
                            coordinates.removeAll()
                            coordinates = getShipCoordinates(size: size, board: board)
                            return coordinates
                        }
                        
                    }
                        //index was out of bounds go backwards
                    else
                    {
                        //no way possible restart
                        coordinates.removeAll()
                        coordinates = getShipCoordinates(size: size, board: board)
                        return coordinates
                    }
                }
                return coordinates
            }
        }
    }
}
