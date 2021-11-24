//
//  BoardCollectionViewController.swift
//  TicTacToe
//
//  Created by Robin Xia on 2021-11-23.
//

import UIKit


class BoardCollectionViewController: UICollectionViewController {

    var dataSource = [Board]()
    
    let game = Game()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(BoardViewCell.self, forCellWithReuseIdentifier: "BoardCell")
        
        dataSource = game.createBoard(boardSize: 9)


    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let boardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoardCell", for: indexPath) as? BoardViewCell {
            
            boardCell.configureBoard(with: dataSource[indexPath.row])
            
            cell = boardCell
            
        }
        
        return cell
    }


}
