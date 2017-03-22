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
        
        
        let rightButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addNewGame))
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    private var contentVIew: UITableView! {return view as! UITableView}
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        //TODO: what should happen when this view controllers view appears?
    //    }
    //    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    //        {
    //
    //    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return gameList.numGames
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = "Game # \(indexPath.row)"
        cell.backgroundColor = UIColor.lightGray
        
        // cell.contentView.addSubview(someView)
        //navigationController?.pushViewController(colorViewDetailController, animated: true)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let color: UIColor = colorForIndex(index: indexPath.row)
        let index: Int = indexPath.row
        let game: Game = gameList.gameWithIndex(gameIndex: index)
        let gameViewController: GameViewController = GameViewController(game: game)!
        navigationController?.pushViewController(gameViewController, animated: true)
    }
    func addNewGame()
    {
        //NSLog("Button HIT!")
        gameList.addGame(game: Game())
        tableView.reloadData()
    }

    
}
