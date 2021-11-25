//
//  Board.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-23.
//

import Foundation
import UIKit

class Board {
    let isChecked: Bool
    let checkedBy: String?
    let boardIndex: Int
    let pieceImage: UIImage?
    
    init(isChecked: Bool, checkedBy: String?, boardIndex: Int, pieceImage: UIImage?) {
        self.isChecked = isChecked
        self.checkedBy = checkedBy
        self.boardIndex = boardIndex
        self.pieceImage = pieceImage
    
        
    }
    
}
