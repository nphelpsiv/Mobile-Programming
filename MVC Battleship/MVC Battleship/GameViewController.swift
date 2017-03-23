//
//  GameViewController.swift
//  MVC Battleship
//
//  Created by u0669056 on 3/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, GameViewDelegate {
    private var _game: Game? = nil
    private var touchPoint: CGPoint = CGPoint.zero
    var alertController: UIAlertController? = nil
    var alertController2: UIAlertController? = nil
    var alertController3: UIAlertController? = nil
    var shipWasDestroyed: Bool = false
    var gameWon: Bool = false
    
    init?(game: Game) {
        _game = game
        super.init(nibName: nil, bundle: nil)
        //game.delegates.append(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        view = GameView()
        
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.lightGray
        gameView.delegate  = self
        refresh()
    }
    

    var gameView: GameView {
        return view as! GameView
    }
    
    func refresh() {
        var viewTokens: [String] = []
        for boardCol: Int in 0 ..< (_game?.board.count)! {
            for boardRow: Int in 0 ..< (_game?.board[boardCol].count)! {
                let token: Game.Token = (_game?.board[boardCol][boardRow])!
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
        
        var viewDefendTokens: [String] = []
        
        for boardCol: Int in 0 ..< (_game?.defendTopBoard.count)! {
            for boardRow: Int in 0 ..< (_game?.defendTopBoard[boardCol].count)! {
                let token: Game.Token = (_game?.defendTopBoard[boardCol][boardRow])!
                switch token {
                case .none : viewDefendTokens.append(" ")
                case .hit : viewDefendTokens.append("\u{2705}")
                case .miss : viewDefendTokens.append("\u{274C}")
                case .ship  : viewDefendTokens.append("\u{1F6A2}")
                default: break
                }
            }
        }
        
        gameView.tokensDefend = viewDefendTokens
        
    }
    func toast(toast: String)
    {
        if(toast == "Miss!")
        {
            if(shipWasDestroyed == false && gameWon == false)
            {
                alertController = UIAlertController(title: toast, message: nil, preferredStyle: .alert)
                self.present(alertController!, animated: true, completion: nil)
                _ = Timer.scheduledTimer(timeInterval: 0.06, target: self, selector: #selector(dismissMessage), userInfo: nil, repeats: false)
            }
        }

    }
    
    func dismissMessage()
    {
        alertController?.dismiss(animated: true, completion: nil)
    }
    
    func toast2(toast: String)
    {
        if(gameWon == false)
        {
            alertController2 = UIAlertController(title: toast, message: nil, preferredStyle: .alert)
            self.present(alertController2!, animated: true, completion: nil)
            _ = Timer.scheduledTimer(timeInterval: 0.06, target: self, selector: #selector(dismissMessage2), userInfo: nil, repeats: false)
        }

    }
    
    func dismissMessage2()
    {
        alertController2?.dismiss(animated: true, completion: nil)
    }
    func toast3(toast: String)
    {
        alertController3 = UIAlertController(title: toast, message: nil, preferredStyle: .alert)
        self.present(alertController3!, animated: true, completion: nil)
        _ = Timer.scheduledTimer(timeInterval: 0.06, target: self, selector: #selector(dismissMessage3), userInfo: nil, repeats: false)
    }
    
    func dismissMessage3()
    {
        alertController3?.dismiss(animated: true, completion: nil)
    }
    
    
    
    func rectWithTouchedPointAt(col: Int, row: Int) {
        //NSLog("Called delegate rect with touchpoint")
        _game?.takeMove(col: row, row: col)
        //gameView.setNeedsDisplay()
        refresh()
        if(_game?.currentPlayerIs1)!
        {
            if((_game?.ship5Health2)! <= 0 && (_game?.ship4Health2)! <= 0 && (_game?.ship3Health2)! <= 0 && (_game?.ship2Health2)! <= 0 && (_game?.ship1Health2)! <= 0)
            {
                gameWon = true
                toast3(toast: "Player 1 won!")
            }
            if((_game?.ship5Health2)! == 0)
            {
                shipWasDestroyed = true
                _game?.ship5Health2 = (_game?.ship5Health2)! - 1
                toast2(toast: "Ship Destroyed!")
            }
            else if((_game?.ship4Health2)! == 0)
            {
                shipWasDestroyed = true
                _game?.ship4Health2 = (_game?.ship4Health2)! - 1
                toast2(toast: "Ship Destroyed!")
            }
            else if((_game?.ship3Health2)! == 0)
            {
                shipWasDestroyed = true
                _game?.ship3Health2 = (_game?.ship3Health2)! - 1
                toast2(toast: "Ship Destroyed!")
            }
            else if((_game?.ship2Health2)! == 0)
            {
                shipWasDestroyed = true
                _game?.ship2Health2 = (_game?.ship2Health2)! - 1
                toast2(toast: "Ship Destroyed!")
            }
            else if((_game?.ship1Health)! == 0)
            {
                shipWasDestroyed = true
                _game?.ship1Health2 = (_game?.ship1Health2)! - 1
                toast2(toast: "Ship Destroyed!")
            }
        }
        else
        {
            if((_game?.ship5Health)! <= 0 && (_game?.ship4Health)! <= 0 && (_game?.ship3Health)! <= 0 && (_game?.ship2Health)! <= 0 && (_game?.ship1Health)! <= 0)
            {
                gameWon = true
                toast3(toast: "Player 2 won!")
            }
            if((_game?.ship5Health)! == 0)
            {
                shipWasDestroyed = true
                _game?.ship5Health = (_game?.ship5Health)! - 1
                toast2(toast: "Ship Destroyed!")
            }
            else if((_game?.ship4Health)! == 0)
            {
                shipWasDestroyed = true
                _game?.ship4Health = (_game?.ship4Health)! - 1
                toast2(toast: "Ship Destroyed!")
            }
            else if((_game?.ship3Health)! == 0)
            {
                shipWasDestroyed = true
                _game?.ship3Health = (_game?.ship3Health)! - 1
                toast2(toast: "Ship Destroyed!")
            }
            else if((_game?.ship2Health)! == 0)
            {
                shipWasDestroyed = true
                _game?.ship2Health = (_game?.ship2Health)! - 1
                toast2(toast: "Ship Destroyed!")
            }
            else if((_game?.ship1Health)! == 0)
            {
                shipWasDestroyed = true
                _game?.ship1Health = (_game?.ship1Health)! - 1
                toast2(toast: "Ship Destroyed!")
            }
        }
        
        
        
    }
}
