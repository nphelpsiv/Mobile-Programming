//
//  GameViewController.swift
//  MVC Battleship
//
//  Created by u0669056 on 3/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, GameViewDelegate {
    private let _game: Game = Game()
    private var touchPoint: CGPoint = CGPoint.zero
    
    override func loadView() {
        view = GameView()
        
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.lightGray
        gameView.delegate  = self
        _game.placeShip(size: 5);
        _game.placeShip(size: 4);
        _game.placeShip(size: 3);
        _game.placeShip(size: 2);
        refresh()
    }
    

    var gameView: GameView {
        return view as! GameView
    }
    
    func refresh() {
        var viewTokens: [String] = []
        for boardCol: Int in 0 ..< _game.board.count {
            for boardRow: Int in 0 ..< _game.board[boardCol].count {
                let token: Game.Token = _game.board[boardCol][boardRow]
                switch token {
                case .none : viewTokens.append(" ")
                case .hit : viewTokens.append("\u{2705}")
                case .miss : viewTokens.append("\u{274C}")
                case .ship  : viewTokens.append("\u{1F6A2}")
                default: break
                }
            }
        }
        
        gameView.tokens = viewTokens
    }
    func rectWithTouchedPointAt(col: Int, row: Int) {
        NSLog("Col: " + "\(col)" + " Row: " + "\(row)")
        _game.takeMove(col: row, row: col)
        refresh()
        gameView.setNeedsDisplay()
        
    }
}
