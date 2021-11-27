//
//  PlayerModel.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-27.
//

import Foundation
import UIKit

class PlayerModel {
    
   private var player1 = Player(name: "", wins: 0, playerImage: UIImage(named: "staricon"), squares: nil)
    
   private var player2 = Player(name: "", wins: 0, playerImage: UIImage(named: "circleicon"), squares: nil)
    
    
    
    
    func createPlayer(name: String) {
        if player1.name == "" {
            player1.name = name
        } else {
            player2.name = name
        }
    }
    
    func getPlayer1 () -> Player {
        return player1
    }
    
    func getPlayer2 () -> Player {
        return player2
    }
    
    func checkSquare (player: Player, squareIndex: Int) {
        player.squares?.append(squareIndex)
    }
    
}
