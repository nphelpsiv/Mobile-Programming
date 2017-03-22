//
//  GameModel.swift
//  MVC Battleship
//
//  Created by u0669056 on 3/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import Foundation

class Game {
    
    
    var ships: [(shipID: Int, shipCoords: [(col: Int, row: Int)])] = []
    public var ship5Health = 5
    public var ship4Health = 4
    public var ship3Health = 3
    public var ship2Health = 3
    public var ship1Health = 2
    
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
        placeShip(size: 5, board: "Top", shipID: 5);
        placeShip(size: 4, board: "Top", shipID: 4);
        placeShip(size: 3, board: "Top", shipID: 3);
        placeShip(size: 3, board: "Top", shipID: 2);
        placeShip(size: 2, board: "Top", shipID: 1);
        
        placeShip(size: 5, board: "Bot", shipID: 5);
        placeShip(size: 4, board: "Bot", shipID: 4);
        placeShip(size: 3, board: "Bot", shipID: 3);
        placeShip(size: 3, board: "Bot", shipID: 2);
        placeShip(size: 2, board: "Bot", shipID: 1);
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
            
            
            for ship in ships
            {
                //NSLog("Col: " + "\(col)" + " Row: " + "\(row)" + " ShipCol: " + "\(ship.col)" + " ShipRow: " + "\(ship.row)")
                for shipCoord in ship.shipCoords
                {
                    if(shipCoord.col == col && shipCoord.row == row)
                    {
                        NSLog("Set to decrement a ships health")
                        switch ship.shipID {
                        case 5:
                            ship5Health = ship5Health - 1
                        case 4:
                            ship4Health = ship4Health - 1
                        case 3:
                            ship3Health = ship3Health - 1
                        case 2:
                            ship2Health = ship2Health - 1
                        case 1:
                            ship1Health = ship1Health - 1
                        default:
                            NSLog("Error in decrement ship health")
                        }
                    }
                }
            }
        }
        

        
    }
    public func placeShip(size: Int, board: String, shipID: Int)
    {
        var shipCoordinates: [(col: Int, row: Int, shipID: Int)] = []
        shipCoordinates = getShipCoordinates(size: size, board: board, shipID: shipID)
        for coord in shipCoordinates
        {
            ships.append((shipID: shipID, shipCoords: [(col: coord.col, row: coord.row)]))
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
    
    private func getShipCoordinates(size: Int, board: String, shipID: Int) -> [(col: Int, row: Int, shipID: Int)]
    {
        if(board == "Top")
        {
            var coordinates: [(col: Int, row: Int, shipID: Int)] = []
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
                            coordinates.append((col: randCol + index, row: randRow, shipID: shipID))
                        }
                            //already ship in way try again
                        else
                        {
                            
                            //no way possible restart
                            coordinates.removeAll()
                            coordinates = getShipCoordinates(size: size, board: board, shipID: shipID)
                            return coordinates
                            
                        }
                        
                    }
                        //was out of bounds try again
                    else
                    {
                        //no way possible restart
                        coordinates.removeAll()
                        coordinates = getShipCoordinates(size: size, board: board, shipID: shipID)
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
                            coordinates.append((col: randCol, row: randRow + index, shipID: shipID))
                        }
                            //index was already a ship go backwards
                        else
                        {
                            
                            //no way possible restart
                            coordinates.removeAll()
                            coordinates = getShipCoordinates(size: size, board: board, shipID: shipID)
                            return coordinates
                        }
                        
                    }
                        //index was out of bounds go backwards
                    else
                    {
                        //no way possible restart
                        coordinates.removeAll()
                        coordinates = getShipCoordinates(size: size, board: board, shipID: shipID)
                        return coordinates
                    }
                }
                return coordinates
            }
        }
        else
        {
            var coordinates: [(col: Int, row: Int, shipID: Int)] = []
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
                            coordinates.append((col: randCol + index, row: randRow, shipID: shipID))
                        }
                            //already ship in way try again
                        else
                        {
                            
                            //no way possible restart
                            coordinates.removeAll()
                            coordinates = getShipCoordinates(size: size, board: board, shipID: shipID)
                            return coordinates
                            
                        }
                        
                    }
                        //was out of bounds try again
                    else
                    {
                        //no way possible restart
                        coordinates.removeAll()
                        coordinates = getShipCoordinates(size: size, board: board, shipID: shipID)
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
                            coordinates.append((col: randCol, row: randRow + index, shipID: shipID))
                        }
                            //index was already a ship go backwards
                        else
                        {
                            
                            //no way possible restart
                            coordinates.removeAll()
                            coordinates = getShipCoordinates(size: size, board: board, shipID: shipID)
                            return coordinates
                        }
                        
                    }
                        //index was out of bounds go backwards
                    else
                    {
                        //no way possible restart
                        coordinates.removeAll()
                        coordinates = getShipCoordinates(size: size, board: board, shipID: shipID)
                        return coordinates
                    }
                }
                return coordinates
            }
        }
    }
}
