//
//  Player.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-23.
//

import Foundation
import UIKit

class Player {
    var name: String
    var wins: Int
    var playerImage: String
    var squares: [Int]?
    
    init(name: String, wins: Int = 0, playerImage: String, squares: Array<Int>?) {
        self.name = name
        self.wins = wins
        self.playerImage = playerImage
        self.squares = squares
    }
    
    func awardPoint (player: Player) {
        player.wins += 1
    }
}
