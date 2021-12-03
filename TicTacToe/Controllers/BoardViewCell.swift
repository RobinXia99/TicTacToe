//
//  BoardViewCell.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-23.
//

import UIKit

class BoardViewCell: UICollectionViewCell {
   
    @IBOutlet weak var boardIndexImage: UIImageView!
    
    
    func configureBoard(with boardIndex: Square) {
        boardIndexImage.image = boardIndex.playerImage
    }
    
}
