
//
//  GameList.swift
//  MVC Battleship
//
//  Created by u0669056 on 3/21/17.
//  Copyright © 2017 u0669056. All rights reserved.
//

import Foundation

//protocol GameListDelegate {
//    <#requirements#>
//}

class GameList
{
    private var games: [Game] = []
    
    
    var numGames: Int{
        return games.count
    }
    
    func gameWithIndex(gameIndex: Int) -> Game
    {
        return games[gameIndex]
    }
    func addGame(game: Game)
    {
        games.append(game)
    }
    func removeGameAtIndex(game: String)
    {
        for gameIndex: Int in 0..<games.count
        {
            //for tokenIndex: Int in 0 ..< min(100, tokens.count)
            if(game == games[gameIndex].ships.description)
            {
                games.remove(at: gameIndex)
                break;
            }
        }
        
    }
}
