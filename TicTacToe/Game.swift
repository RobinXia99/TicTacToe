//
//  Game.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-23.
//

import Foundation


class Game {
    
    func createBoard(boardSize: Int) -> [Board] {
        var boardContent = [Board]()
        for index in 0...boardSize {
            boardContent.append(Board(isChecked: false, checkedBy: nil, boardIndex: index, pieceImage: nil))
        }
        
        return boardContent
    }
    
}
