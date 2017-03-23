//
//  GameModel.swift
//  MVC Battleship
//
//  Created by u0669056 on 3/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import Foundation

protocol GameModelDelegate: class {
    func gameWinner() -> String
    func player1NumShips() -> Int
    func player2NumShips() -> Int
    
    
}
class Game {
    
    
    public var player1ShipsRemaining = 5
    public var player2ShipsRemaining = 5
    
    var ships: [(shipID: Int, shipCoords: [(col: Int, row: Int)])] = []
    //player 1 ships
    public var ship5Health = 5
    public var ship4Health = 4
    public var ship3Health = 3
    public var ship2Health = 3
    public var ship1Health = 2
    
    //player2 ships
    public var ship5Health2 = 5
    public var ship4Health2 = 4
    public var ship3Health2 = 3
    public var ship2Health2 = 3
    public var ship1Health2 = 2
    
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
    private var _tempBoard: [[Token]] = [[.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                              [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                              [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                              [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                              [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                              [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                              [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                              [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                              [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none],
                                              [.none, .none, .none, .none, .none, .none, .none, .none, .none, .none]]
    
    
    public var currentPlayerIs1: Bool = true
    
    
    
    init()
    {
        placeShip(size: 5, board: "Top", shipID: 15);
        placeShip(size: 4, board: "Top", shipID: 14);
        placeShip(size: 3, board: "Top", shipID: 13);
        placeShip(size: 3, board: "Top", shipID: 12);
        placeShip(size: 2, board: "Top", shipID: 11);
        
        placeShip(size: 5, board: "Bot", shipID: 25);
        placeShip(size: 4, board: "Bot", shipID: 24);
        placeShip(size: 3, board: "Bot", shipID: 23);
        placeShip(size: 3, board: "Bot", shipID: 22);
        placeShip(size: 2, board: "Bot", shipID: 21);
    }
    
    public var winner: String {
        if(delegate?.gameWinner() == nil)
        {
            return "Unknown"
        }
        else
        {
            return (delegate?.gameWinner())!
        }
        
    }
    public var player1Ships: Int{
        if(delegate?.player1NumShips() == nil)
        {
            return 5
        }
        else
        {
            return (delegate?.player1NumShips())!
        }
        
    }
    public var player2Ships: Int{
        if(delegate?.player2NumShips() == nil)
        {
            return 5
        }
        else
        {
            return (delegate?.player2NumShips())!
        }
    }
    public func decrementPlayer1Ships()
    {
        player1ShipsRemaining = player1ShipsRemaining - 1
    }
    public func decrementPlayer2Ships()
    {
        player2ShipsRemaining = player2ShipsRemaining - 1
    }
    public var board: [[Token]] {
        return _board
    }
    public var defendTopBoard: [[Token]] {
        return _defendTopBoard
    }
    public func changePlayer()
    {
        currentPlayerIs1 = !currentPlayerIs1
        if(currentPlayerIs1)
        {
            NSLog("Player1 turn")
        }
        else
        {
            NSLog("Player2 turn")
        }
        _tempBoard = _board
        _board = _defendTopBoard
        _defendTopBoard = _tempBoard
    }
    
    public func takeMove(col: Int, row: Int) {
        if(currentPlayerIs1)
        {
            if (_board[col][row] == .none) {
                //_board[col][row] = currentPlayerIs1 ? .miss : .hit
                //if current player is 1
                _board[col][row] = .miss
                NSLog("Player1 Click Miss")
                
            }
            else if(_board[col][row] == .ship)
            {
                _board[col][row] = .hit
                
                NSLog("Player1 Click Hit")
                outer: for ship in ships
                {
                    //NSLog("Col: " + "\(col)" + " Row: " + "\(row)" + " ShipCol: " + "\(ship.col)" + " ShipRow: " + "\(ship.row)")
                    inner: for shipCoord in ship.shipCoords
                    {
                        if(shipCoord.col == col && shipCoord.row == row && ship.shipID > 20)
                        {
                            
                            switch ship.shipID {
                            case 25:
                                ship5Health2 = ship5Health2 - 1
                                NSLog("Set to decrement a ships health 25" + " " + "\(ship.shipID)")
                                break inner
                            case 24:
                                ship4Health2 = ship4Health2 - 1
                                NSLog("Set to decrement a ships health 24" + " " + "\(ship.shipID)")
                                break inner
                            case 23:
                                ship3Health2 = ship3Health2 - 1
                                NSLog("Set to decrement a ships health 23" + " " + "\(ship.shipID)")
                                break inner
                            case 22:
                                ship2Health2 = ship2Health2 - 1
                                NSLog("Set to decrement a ships health 22" + " " + "\(ship.shipID)")
                                break inner
                            case 21:
                                ship1Health2 = ship1Health2 - 1
                                NSLog("Set to decrement a ships health 21" + " " + "\(ship.shipID)")
                                break inner
                            default:
                                NSLog("Error in decrement ship health")
                                break;
                            }
                            break outer
                        }
                    }
                }
            }
        }
        //player is 2
        else
        {
            if (_board[col][row] == .none) {

                _board[col][row] = .miss
                NSLog("Player 2 Click Miss")
                
            }
            else if(_board[col][row] == .ship)
            {
                _board[col][row] = .hit
                
                NSLog("Player 2 Click Hit")
                outer: for ship in ships
                {
                    inner: for shipCoord in ship.shipCoords
                    {
                        if(shipCoord.col == col && shipCoord.row == row && ship.shipID < 20)
                        {
                            
                            switch ship.shipID {
                            case 15:
                                ship5Health = ship5Health - 1
                                NSLog("Set to decrement a ships health 5" + " " + "\(ship.shipID)")
                                break inner
                            case 14:
                                ship4Health = ship4Health - 1
                                NSLog("Set to decrement a ships health 4" + " " + "\(ship.shipID)")
                                break inner
                            case 13:
                                ship3Health = ship3Health - 1
                                NSLog("Set to decrement a ships health 3" + " " + "\(ship.shipID)")
                                break inner
                            case 12:
                                ship2Health = ship2Health - 1
                                NSLog("Set to decrement a ships health 2" + " " + "\(ship.shipID)")
                                break inner
                            case 11:
                                ship1Health = ship1Health - 1
                                NSLog("Set to decrement a ships health 1" + " " + "\(ship.shipID)")
                                break inner
                            default:
                                NSLog("Error in decrement ship health")
                                break;
                            }
                            break outer
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
    weak var delegate: GameModelDelegate? = nil
}

