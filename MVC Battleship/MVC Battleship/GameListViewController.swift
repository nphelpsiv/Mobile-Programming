//
//  GameListViewController.swift
//  MVC Battleship
//
//  Created by u0669056 on 3/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//


import UIKit

class GameListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    private var gameList: GameList = GameList()

    
    private var tableView: UITableView{
        return view as! UITableView
    }
    
    
    override func loadView() {
        //TODO: set the view property
        let gameTableView: UITableView = UITableView()
        //frame: window!.rootViewController!.view.bounds
        view = gameTableView
    }
    
    override func viewDidLoad() {
        //TODO: Customize view {and subviews)
        contentVIew.dataSource = self
        contentVIew.delegate = self
        
        contentVIew.dataSource = self
        
        
        let rightButtonItem = UIBarButtonItem.init(title: "New Game", style: .plain,  target: self, action: #selector(addNewGame))
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private var contentVIew: UITableView! {return view as! UITableView}
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return gameList.numGames
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.font = cell.textLabel?.font.withSize(12)
        if(gameList.gameWithIndex(gameIndex: indexPath.item).winner == "Unknown")
        {
            if(gameList.gameWithIndex(gameIndex: indexPath.item).currentPlayerIs1)
            {
                cell.textLabel?.text = "Active Game: Player 1 Turn" + "   " + "P1Ships: " + "\(gameList.gameWithIndex(gameIndex: indexPath.item).player1Ships)" +
                " P2Ships: " + "\(gameList.gameWithIndex(gameIndex: indexPath.item).player2Ships)"
            }
            else
            {
                cell.textLabel?.text = "Active Game: Player 2 Turn" + "   " + "P1Ships: " + "\(gameList.gameWithIndex(gameIndex: indexPath.item).player1Ships)" +
                    " P2Ships: " + "\(gameList.gameWithIndex(gameIndex: indexPath.item).player2Ships)"
            }
        }
        else
        {
            if(gameList.gameWithIndex(gameIndex: indexPath.item).winner == "Player1")
            {
                cell.textLabel?.text = "Completed: Player 1 Wins!"
            }
            else
            {
                cell.textLabel?.text = "Completed: Player 2 Wins!"
            }
        }
        cell.backgroundColor = UIColor.lightGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index: Int = indexPath.row
        let game: Game = gameList.gameWithIndex(gameIndex: index)
        let gameViewController: GameViewController = GameViewController(game: game, gameList: gameList)!
        navigationController?.pushViewController(gameViewController, animated: true)
    }
    func addNewGame()
    {
        gameList.addGame(game: Game())
        tableView.reloadData()
    }

    
}
