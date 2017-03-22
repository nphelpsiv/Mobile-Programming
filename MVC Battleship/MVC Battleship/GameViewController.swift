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
        alertController = UIAlertController(title: toast, message: nil, preferredStyle: .alert)
        self.present(alertController!, animated: true, completion: nil)
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(dismissMessage), userInfo: nil, repeats: false)
    }
    
    func dismissMessage()
    {
        alertController?.dismiss(animated: true, completion: nil)
    }
    
    
    func rectWithTouchedPointAt(col: Int, row: Int) {
        _game?.takeMove(col: row, row: col)
        refresh()
        gameView.setNeedsDisplay()
        
    }
}
