//
//  Player.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-23.
//

import Foundation
import UIKit

class Player {
    let name: String
    let wins: Int
    let pieceImage: UIImage?
    
    init(name: String, wins: Int, pieceImage: UIImage?) {
        self.name = name
        self.wins = wins
        self.pieceImage = pieceImage
    }
}
