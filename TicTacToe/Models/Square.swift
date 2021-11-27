//
//  Board.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-23.
//

import Foundation
import UIKit

class Square {
    var isChecked: Bool
    var squareIndex: Int
    var playerImage: UIImage?
    
    init(isChecked: Bool, squareIndex: Int, playerImage: UIImage?) {
        self.isChecked = isChecked
        self.squareIndex = squareIndex
        self.playerImage = playerImage
    
        
    }
    
}
